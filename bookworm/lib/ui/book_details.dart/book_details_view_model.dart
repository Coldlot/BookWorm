import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/repositories/appearence_repository.dart';
import 'package:bookworm/repositories/favorite_book_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/reading_page/reading_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      favoriteList.favorites.add(book);
    } else {
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
