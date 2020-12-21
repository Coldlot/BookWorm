import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadingPageViewModel extends GetxBaseViewModel {
  final BookModel book;

  final themeService = Get.find<BWThemeService>();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void dismiss() {
    Get.back();
  }

  ReadingPageViewModel({@required this.book});
}
