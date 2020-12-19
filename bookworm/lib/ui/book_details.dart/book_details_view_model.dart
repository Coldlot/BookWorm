import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailsViewModel extends GetxBaseViewModel {
  final BookModel book;
  final themeService = Get.find<BWThemeService>();

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  void toggleToFavorites() {
    _isFavorite = !_isFavorite;
    update();
  }

  BookDetailsViewModel({@required this.book});
}
