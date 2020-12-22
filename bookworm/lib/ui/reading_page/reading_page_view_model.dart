import 'dart:io';

import 'package:bookworm/app/getx_base_view_model.dart';
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

  //TODO: add cache
  Future<void> downloadBook() async {
    setBusy(true);
    File downloadedFile;
    if (book.isExternal) {
      downloadedFile = File(book.fileUrl);
    } else {
      downloadedFile =
          (await DefaultCacheManager().downloadFile(book.fileUrl)).file;
    }
    // final tempDir = await getTemporaryDirectory();
    bookFile = downloadedFile;
    // bookFile = File('${tempDir.path}/${book.fileUrl.split('/').last}');
    // logger.i(bookFile.path);
    // logger.d(bookFile.readAsBytesSync());
    // bookFile.writeAsBytesSync(downloadedFile.readAsBytesSync());
    // logger.d(bookFile.readAsBytesSync());
    
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
