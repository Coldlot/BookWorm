import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookThumb extends StatelessWidget {
  final themeService = Get.find<BWThemeService>();

  final Function onTap;
  final String image;
  final String bookName;

  final bool isEditingMode;
  final Function onDelete;

  BookThumb(
      {@required this.image,
      @required this.bookName,
      this.onTap,
      this.isEditingMode = false,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: image == 'placeholder'
                ? AssetImage(themeService.isDarkMode ? "assets/images/external_dark.png" : "assets/images/external.png")
                : CachedNetworkImageProvider(image, cacheKey: image),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                themeService.peachThemed,
                themeService.peachThemed.withOpacity(0.2),
              ],
              stops: const [0.3, 1.3],
            ),
          ),
          child: Stack(
            overflow: Overflow.visible,
            children: [
              if (isEditingMode)
                Positioned(
                  top: -8,
                  right: -1,
                  child: GestureDetector(
                    onTap: onDelete,
                    child: SvgPicture.asset(
                      "assets/icons/delete.svg",
                      color: themeService.redThemed,
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AutoSizeText(
                  bookName,
                  style: themeService.nameOfBookThemed,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
