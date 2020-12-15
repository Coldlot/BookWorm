import 'package:bookworm/res/res.dart';
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
          backgroundColor: BWColors.beige,
          appBar: CupertinoNavigationBar(
            middle: Text(S.of(context).library, style: BWStyle.headerStyle),
            trailing: SvgPicture.asset('assets/icons/downloadBook.svg'),
            backgroundColor: BWColors.peach,
          ),
          body: SafeArea(
            child: Center(
              child: EmptyPlaceholder(),
            ),
          ),
        );
      },
    );
  }
}
