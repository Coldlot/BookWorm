import 'dart:io';

import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/datamodels/favorite_list.dart';
import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/repositories/favorite_book_repository.dart';
import 'package:bookworm/res/res.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/book_details.dart/book_details_view.dart';
import 'package:bookworm/ui/tabs/tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class FavoritesViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  final favoritesRepository = Get.find<FavoriteBooksRepository>();

  List<BookModel> favorites;

  bool _isEditingMode = false;
  bool get isEditingMode => _isEditingMode;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    setBusy(true);
    favorites = (await favoritesRepository.getFavoriteBooks()).favorites;
    setBusy(false);
    update();
  }

  void refreshBooks() {
    fetchFavorites();
  }

  Future<void> deleteChosenFavorite(int index) async {
    Get.dialog(CupertinoAlertDialog(
      title: Text(S.of(Get.context).deletion, style: BWStyle.headerStyle),
      content: Text(S.of(Get.context).deleteConfirmation,
          style: BWStyle.smallButton),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Get.back();
          },
          child: Text(
            S.of(Get.context).cancel,
            style: BWStyle.headerStyle.copyWith(color: Colors.red),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () async {
            final book = favorites[index];
            book.isCached = false;
            if (!book.isExternal) {
              final docs = await getLibraryDirectory();
              await File('${docs.path}/${book.fileUrl.split('/').last}')
                  .delete();
            }

            favorites.removeAt(index);
            await favoritesRepository.clear();
            final fl = FavoriteList();

            fl.favorites = favorites;
            await favoritesRepository.saveBooks(fl);
            if (favorites.isEmpty) _isEditingMode = false;
            update();
            Get.back();
          },
          child: Text(
            S.of(Get.context).ok,
            style: BWStyle.headerStyle.copyWith(color: Colors.blue),
          ),
        ),
      ],
    ));
  }

  void toggleEditMode() {
    _isEditingMode = !_isEditingMode;
    update();
  }

  void showDetails(int index) {
    Get.to(BookDetailsView(book: favorites[index]));
  }

  void showBooksList() {
    BWTabBar.state.showIndex(0);
  }
}
