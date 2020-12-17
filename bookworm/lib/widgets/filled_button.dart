import 'package:bookworm/res/res.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilledButton extends StatelessWidget {
  final themeService = Get.find<BWThemeService>();
  final Function onTap;
  final String text;

  FilledButton({@required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: themeService.darkBlueThemed),
        height: 55,
        width: 270,
        child: Center(
          child: Text(
            text,
            style: themeService.headerStyleThemed.copyWith(
                color:
                    themeService.isDarkMode ? BWColors.black : BWColors.white),
          ),
        ),
      ),
    );
  }
}
