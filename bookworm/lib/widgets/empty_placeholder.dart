import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';

// ignore: must_be_immutable
class EmptyPlaceholder extends StatelessWidget {
  final themeService = Get.find<BWThemeService>();
  final bool isInternetConnection;
  final Function onTap;
  EmptyPlaceholder({this.isInternetConnection = false, this.onTap});

  List<String> _networkImages;
  List<String> _emptyImages;

  @override
  Widget build(BuildContext context) {
    _networkImages = themeService.getNetworkImages();
    _emptyImages = themeService.getEmptyImages();
    return Column(
      children: [
        Image.asset(
            isInternetConnection ? _networkImages.first : _emptyImages.first),
        const SizedBox(height: 20),
        Text(
            isInternetConnection
                ? S.of(context).networkConnection
                : S.of(context).emptyList,
            style: themeService.illustrationStyleThemed),
        const SizedBox(height: 25),
        if (!isInternetConnection)
          OutlineButton(
            onPressed: onTap,
            child: Text(
              S.of(context).watchBooksList,
              style: themeService.buttonTextStyleThemed,
            ),
          ),
      ],
    );
  }
}
