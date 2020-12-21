import 'package:bookworm/widgets/book_search.dart';
import 'package:bookworm/widgets/books_grid.dart';
import 'package:bookworm/widgets/empty_placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import 'favorites_view_model.dart';

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
            leading: GestureDetector(
              onTap: model.refreshBooks,
              child: Icon(Icons.refresh, color: model.themeService.blackThemed),
            ),
            middle: Text(S.of(context).myBooks,
                style: model.themeService.headerStyleThemed),
            backgroundColor: model.themeService.peachThemed,
            trailing: !model.isBusy && model.favorites.isEmpty
                ? const SizedBox(width: 0, height: 0)
                : GestureDetector(
                    onTap: model.toggleEditMode,
                    child: SvgPicture.asset(
                      "assets/icons/edit.svg",
                      color: model.themeService.blackThemed,
                    ),
                  ),
          ),
          body: SafeArea(
            child: model.isBusy
                ? const Center(child: CupertinoActivityIndicator())
                : Stack(
                    children: [
                      if (model.favorites.isNotEmpty)
                        Positioned(
                          top: 5,
                          left: 30,
                          right: 30,
                          child: BookSearch(),
                        ),
                      Positioned(
                        top: 15,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Padding(
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
                                  isEditingMode: model.isEditingMode,
                                  onThumbDelete: model.deleteChosenFavorite,
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
