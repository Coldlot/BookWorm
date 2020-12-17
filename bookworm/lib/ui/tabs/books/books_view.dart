import 'package:bookworm/widgets/book_thumb.dart';
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
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                    child: model.isConnected
                        ? GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 23,
                          mainAxisSpacing: 27,
                          childAspectRatio: 0.7,
                          children: [
                            BookThumb(
                              image: "assets/images/test.png",
                              bookName: 'Агент в кринолине - Хорватова Елена - ...',
                            ),
                            BookThumb(
                              image: "assets/images/test.png",
                              bookName: 'Агент в кринолине - Хорватова Елена - ...',
                            ),
                            BookThumb(
                              image: "assets/images/test.png",
                              bookName: 'Агент в кринолине - Хорватова Елена - ...',
                            ),
                            BookThumb(
                              image: "assets/images/test.png",
                              bookName: 'Агент в кринолине - Хорватова Елена - ...',
                            ),
                            BookThumb(
                              image: "assets/images/test.png",
                              bookName: 'Агент в кринолине - Хорватова Елена - ...',
                            ),
                            BookThumb(
                              image: "assets/images/test.png",
                              bookName: 'Агент в кринолине - Хорватова Елена - ...',
                            ),
                          ],
                        )
                        : Center(
                            child: EmptyPlaceholder(
                              isInternetConnection: true,
                              onTapInternet: model.checkConnection,
                            ),
                        ),
                  ),
          ),
        );
      },
    );
  }
}
