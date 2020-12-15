import 'package:bookworm/res/res.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemRow extends StatelessWidget {
  final Widget trailing;
  final String icon;
  final String text;
  final Function onTap;
  final Color color;

  final themeService = Get.find<BWThemeService>();

  ItemRow({
    @required this.icon,
    @required this.text,
    this.trailing,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icon,
              width: 30, height: 30, color: color ?? BWColors.darkGray),
          const SizedBox(width: 15),
          Text(text, style: themeService.headerStyleThemed),
          const Spacer(),
          trailing,
        ],
      ),
    );
  }
}