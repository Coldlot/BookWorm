import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  final themeService = Get.find<BWThemeService>();
  final bool isFavorite;

  Favorite({@required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isFavorite ? 'assets/icons/favoriteActive.svg' :'assets/icons/favorite.svg',
      color: isFavorite ? themeService.redThemed : themeService.blackThemed,
    );
  }
}
