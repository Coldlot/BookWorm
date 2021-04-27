import 'package:bookworm/widgets/books_grid.dart';
import 'package:bookworm/widgets/empty_placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import 'favorites_view_model.dart';

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
              child: Icon(Icons.refresh,key: ValueKey('refresh'), color: model.themeService.blackThemed),
            ),
            middle: Text(S.of(context).myBooks,            
                style: model.themeService.headerStyleThemed,
                key: Key('favTextKey')),
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
                            isEditingMode: model.isEditingMode,
                            onThumbDelete: model.deleteChosenFavorite,
                          ),
                  ),
          ),
        );
      },
    );
  }
}
