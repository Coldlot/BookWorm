import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookThumb extends StatelessWidget {
  final themeService = Get.find<BWThemeService>();

  final Function onTap;
  final String image;
  final String bookName;

  BookThumb({@required this.image, @required this.bookName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(image),
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
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AutoSizeText(
                bookName,
                style: themeService.nameOfBookThemed,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,
                overflowReplacement: Text(
                  '...',
                  style: themeService.nameOfBookThemed,
                ),
              ),
            )),
      ),
    );
  }
}
