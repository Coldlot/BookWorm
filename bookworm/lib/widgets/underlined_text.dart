import 'package:bookworm/res/res.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnderlinedText extends StatelessWidget {
  final themeService = Get.find<BWThemeService>();
  final Function onTap;
  final String text;

  UnderlinedText({@required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: themeService.illustrationStyleThemed.copyWith(
              color: themeService.isDarkMode ? BWColors.white : BWColors.black,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            height: 1,
            width: text.length.toDouble() * 11,
            color: themeService.blackThemed,
          )
        ],
      ),
    );
  }
}
