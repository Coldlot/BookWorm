import 'package:bookworm/widgets/book_search.dart';
import 'package:bookworm/widgets/books_grid.dart';
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
              onTap: model.addExternalBook,
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
                : Stack(
                    children: [
                      if (model.isConnected)
                        Positioned(
                          top: 5,
                          left: 30,
                          right: 30,
                          child: BookSearch(
                            onChange: model.filter,
                          ),
                        ),
                      Positioned(
                        top: 15,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 25),
                          child: model.isConnected
                              ? BooksGrid(
                                  books: model.filteredBooks,
                                  onThumbTap: model.showDetails,
                                )
                              : Center(
                                  child: EmptyPlaceholder(
                                    isInternetConnection: true,
                                    onTapInternet: model.downloadBooks,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
