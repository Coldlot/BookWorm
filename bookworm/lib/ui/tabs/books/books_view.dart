import 'package:bookworm/widgets/empty_placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import 'books_view_model.dart';

class BooksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BooksViewModel>(
      init: BooksViewModel(),
      builder: (model) {
        return Scaffold(
          backgroundColor: model.themeService.beigeThemed,
          appBar: CupertinoNavigationBar(
            middle: Text(S.of(context).library,
                style: model.themeService.headerStyleThemed),
            trailing: GestureDetector(
              onTap: model.downloadBookTapped,
              child: SvgPicture.asset(
                'assets/icons/downloadBook.svg',
                color: model.themeService.blackThemed,
              ),
            ),
            backgroundColor: model.themeService.peachThemed,
          ),
          body: SafeArea(
            child: model.isBusy
                ? const Center(child: CupertinoActivityIndicator())
                : Container(
                    child: model.isConnected
                        ? SingleChildScrollView()
                        : Center(
                            child: EmptyPlaceholder(isInternetConnection: true),
                        ),
                  ),
          ),
        );
      },
    );
  }
}
