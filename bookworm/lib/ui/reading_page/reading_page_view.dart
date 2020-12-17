import 'package:bookworm/ui/reading_page/reading_page_view_model.dart';
import 'package:bookworm/widgets/favorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_filereader/flutter_filereader.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReadingPageView extends StatelessWidget {
  final String filePath;
  final double scaleFactor;
  final String title;
  final bool isEpub;

  const ReadingPageView({
    @required this.filePath,
    @required this.scaleFactor,
    @required this.title,
    this.isEpub = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReadingPageViewModel>(
      init: ReadingPageViewModel(),
      builder: (model) {
        return Scaffold(
          backgroundColor: model.themeService.beigeThemed,
          appBar: CupertinoNavigationBar(
            leading: GestureDetector(
              onTap: model.dismiss,
              child: Icon(Icons.arrow_back_ios,
                  color: model.themeService.blackThemed),
            ),
            middle: Text(title, style: model.themeService.headerStyleThemed),
            trailing: GestureDetector(
              onTap: model.toggleToFavorites,
              child: Favorite(isFavorite: model.isFavorite),
            ),
            backgroundColor: model.themeService.peachThemed,
          ),
          body: SafeArea(
              child: FileReaderView(
                      loadingWidget: const CupertinoActivityIndicator(),
                      filePath: filePath,
                    )),
        );
      },
    );
  }
}
