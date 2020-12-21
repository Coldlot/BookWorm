import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class BookSearch extends StatelessWidget {
  final Function(String) onChange;

  const BookSearch({this.onChange});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookSearchViewModel>(
      init: BookSearchViewModel(),
      builder: (model) {
        return CupertinoTextField(
          decoration: BoxDecoration(
            color: model.themeService.searchThemed,
            borderRadius: BorderRadius.circular(10),
          ),
          style: model.themeService.headerStyleThemed,
          prefix: Icon(Icons.search, color: model.themeService.blackThemed),
          clearButtonMode: OverlayVisibilityMode.editing,
          placeholder: S.of(context).search,
          placeholderStyle: model.themeService.headerStyleThemed,
          onChanged: onChange,
        );
      },
    );
  }
}

class BookSearchViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  final controller = TextEditingController();
}
