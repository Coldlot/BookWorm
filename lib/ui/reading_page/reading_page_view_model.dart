import 'dart:io';

import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/app/logger.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

class ReadingPageViewModel extends GetxBaseViewModel {
  final BookModel book;

  final themeService = Get.find<BWThemeService>();

  File bookFile;

  @override
  Future<void> onInit() async {
    super.onInit();
    downloadBook();
  }

  Future<void> downloadBook() async {
    setBusy(true);
    File downloadedFile;
    if (book.isExternal) {
      downloadedFile = File(book.fileUrl);
    } else {
      if (book.isCached.isNull || !book.isCached) {
        downloadedFile =
            (await DefaultCacheManager().downloadFile(book.fileUrl)).file;
      } else {
        logger.i(book.storedUrl);
        downloadedFile = File(book.storedUrl);
      }
    }

    bookFile = downloadedFile;

    // if (book.fileUrl.split('/').last.split('.').last == 'epub')
    // controller = EpubController(data: bookFile.readAsBytes());
    setBusy(false);
    update();
  }

  void dismiss() {
    Get.back();
  }

  ReadingPageViewModel({@required this.book});
}
