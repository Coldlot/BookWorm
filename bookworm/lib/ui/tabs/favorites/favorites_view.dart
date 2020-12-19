import 'package:bookworm/widgets/books_grid.dart';
import 'package:bookworm/widgets/empty_placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import 'favorites_view_model.dart';


//TODO: fix update state
//TODO: add edit pencil actions
//TODO: add search
class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesViewModel>(
      init: FavoritesViewModel(),
      builder: (model) {
        return Scaffold(
          backgroundColor: model.themeService.beigeThemed,
          appBar: CupertinoNavigationBar(
            middle: Text(S.of(context).myBooks,
                style: model.themeService.headerStyleThemed),
            backgroundColor: model.themeService.peachThemed,
            trailing: GestureDetector(
              onTap: null,
              child: SvgPicture.asset(
                "assets/icons/edit.svg",
                color: model.themeService.blackThemed,
              ),
            ),
          ),
          body: SafeArea(
            child: model.isBusy
                ? const Center(child: CupertinoActivityIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 25),
                    child: model.favorites.isEmpty
                        ? Center(
                            child: EmptyPlaceholder(
                              onTap: model.showBooksList,
                            ),
                          )
                        : BooksGrid(
                            books: model.favorites,
                            onThumbTap: model.showDetails,
                          ),
                  ),
          ),
        );
      },
    );
  }
}
