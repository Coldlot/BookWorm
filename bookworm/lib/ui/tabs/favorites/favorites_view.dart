import 'package:bookworm/res/res.dart';
import 'package:bookworm/widgets/empty_placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          backgroundColor: BWColors.beige,
          appBar: CupertinoNavigationBar(
            middle: Text(S.of(context).myBooks, style: BWStyle.headerStyle),
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
