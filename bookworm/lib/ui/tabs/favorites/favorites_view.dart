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
          backgroundColor: model.themeService.beigeThemed,
          appBar: CupertinoNavigationBar(
            middle: Text(S.of(context).myBooks, style: model.themeService.headerStyleThemed),
            backgroundColor: model.themeService.peachThemed,
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
