import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/ui/book_details.dart/book_details_view_model.dart';
import 'package:bookworm/widgets/favorite.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BookDetailsView extends StatelessWidget {
  final BookModel book;

  const BookDetailsView({@required this.book});

  //TODO: fix ui
  //TODO: heart state  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookDetailsViewModel>(
      init: BookDetailsViewModel(book: book),
      builder: (model) {
        return Scaffold(
          backgroundColor: model.themeService.beigeThemed,
          appBar: CupertinoNavigationBar(
            trailing: model.isBusy ? Container() : GestureDetector(
              onTap: model.toggleToFavorites,
              child: Favorite(isFavorite: model.isFavorite),
            ),
            middle: AutoSizeText(
              model.book.title,
              style: model.themeService.headerStyleThemed,
              maxLines: 2,
              overflowReplacement: Text(
                "...",
                style: model.themeService.headerStyleThemed,
              ),
            ),
            backgroundColor: model.themeService.peachThemed,
          ),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image(
                        image: book.isExternal
                            ? SvgPicture.asset("assets/book_logo.svg",
                                color: model.themeService.blackThemed)
                            : CachedNetworkImageProvider(model.book.thumbUrl),
                        width: 146,
                        height: 200,
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: S.of(context).title,
                                    style: model.themeService.headerStyleThemed
                                        .copyWith(fontWeight: FontWeight.bold),
                                    children: [
                                  TextSpan(
                                      text: model.book.title,
                                      style: model
                                          .themeService.headerStyleThemed
                                          .copyWith(
                                              fontWeight: FontWeight.normal)),
                                ])),
                            const SizedBox(height: 10),
                            RichText(
                                text: TextSpan(
                                    text: S.of(context).author,
                                    style: model.themeService.headerStyleThemed
                                        .copyWith(fontWeight: FontWeight.bold),
                                    children: [
                                  TextSpan(
                                      text: model.book.author,
                                      style: model
                                          .themeService.headerStyleThemed
                                          .copyWith(
                                              fontWeight: FontWeight.normal)),
                                ])),
                            const SizedBox(height: 10),
                            RichText(
                                text: TextSpan(
                                    text: S.of(context).genre,
                                    style: model.themeService.headerStyleThemed
                                        .copyWith(fontWeight: FontWeight.bold),
                                    children: [
                                  TextSpan(
                                      text: model.book.genre,
                                      style: model
                                          .themeService.headerStyleThemed
                                          .copyWith(
                                              fontWeight: FontWeight.normal)),
                                ])),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    model.book.description,
                    style: model.themeService.headerStyleThemed,
                  ),
                  const SizedBox(height: 40),
                  OutlineButton(
                    borderSide: BorderSide(
                      color: model.themeService.blackThemed,
                    ),
                    onPressed: model.showContent,
                    child: Text(
                      S.of(context).read,
                      style: model.themeService.buttonTextStyleThemed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
