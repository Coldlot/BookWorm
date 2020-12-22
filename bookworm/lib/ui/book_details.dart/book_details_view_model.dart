import 'dart:io';

import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/app/logger.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/repositories/appearence_repository.dart';
import 'package:bookworm/repositories/favorite_book_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/reading_page/reading_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class BookDetailsViewModel extends GetxBaseViewModel {
  final BookModel book;

  final themeService = Get.find<BWThemeService>();
  final appearence = Get.find<AppearenceRepository>();
  final favoritesRepo = Get.find<FavoriteBooksRepository>();

  bool _isFavorite;
  bool get isFavorite => _isFavorite;

  @override
  Future<void> onInit() async {
    super.onInit();
    handleFavoriteState();
  }

  Future<void> handleFavoriteState() async {
    setBusy(true);
    final favoriteList = await favoritesRepo.getFavoriteBooks();
    _isFavorite =
        favoriteList.favorites.map((e) => e.title == book.title).contains(true);
    setBusy(false);
    update();
  }

  Future<void> toggleToFavorites() async {
    final favoriteList = await favoritesRepo.getFavoriteBooks();
    if (!_isFavorite) {
      if (!book.isExternal) {
        final downloadedFile =
            (await DefaultCacheManager().downloadFile(book.fileUrl)).file;
        final docs = await getLibraryDirectory();
        final bookFile = downloadedFile
            .renameSync('${docs.path}/${book.fileUrl.split('/').last}');
        logger.i(docs.path);
        book.storedUrl = bookFile.path;
      }
      book.isCached = true;
      favoriteList.favorites.add(book);
    } else {
      final docs = await getLibraryDirectory();
      book.isCached = false;
      if(!book.isExternal) {
        await File('${docs.path}/${book.fileUrl.split('/').last}').delete();
      }
      favoriteList.favorites
          .removeWhere((element) => element.title == book.title);
    }
    await favoritesRepo.clear();
    await favoritesRepo.saveBooks(favoriteList);

    _isFavorite = !_isFavorite;
    update();
  }

  Future<void> showContent() async {
    final scale = (await appearence.getAppearence()).scaleFactor;
    Get.to(ReadingPageView(
      book: book,
      scaleFactor: scale,
      isEpub:
          // ignore: avoid_bool_literals_in_conditional_expressions
          book.fileUrl.split("/").last.split(".").last == "epub" ? true : false,
    ));
  }

  void dismiss() {
    Get.back();
  }

  BookDetailsViewModel({@required this.book});
}
