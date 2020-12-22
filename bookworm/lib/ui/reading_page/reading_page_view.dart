import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/ui/reading_page/reading_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_filereader/flutter_filereader.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReadingPageView extends StatelessWidget {
  final BookModel book;
  final double scaleFactor;
  final bool isEpub;

  const ReadingPageView({
    @required this.book,
    @required this.scaleFactor,
    this.isEpub = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReadingPageViewModel>(
      init: ReadingPageViewModel(book: book),
      builder: (model) {
        return Scaffold(
          backgroundColor: model.themeService.beigeThemed,
          appBar: CupertinoNavigationBar(
            leading: GestureDetector(
              onTap: model.dismiss,
              child: Icon(Icons.arrow_back_ios,
                  color: model.themeService.blackThemed),
            ),
            middle: AutoSizeText(book.title,
                style: model.themeService.headerStyleThemed,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            backgroundColor: model.themeService.peachThemed,
          ),
          body: SafeArea(
            child: model.isBusy
                ? const Center(child: CupertinoActivityIndicator())
                : //isEpub
                //     ? EpubView(
                //       controller: model.controller,
                //     )
                //:
                FileReaderView(
                    loadingWidget: const CupertinoActivityIndicator(),
                    filePath: model.book.isExternal
                        ? model.book.fileUrl
                        : model.bookFile.path,
                  ),
          ),
        );
      },
    );
  }
}
