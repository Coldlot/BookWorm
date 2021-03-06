import 'package:bookworm/ui/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashViewModel>(
      init: SplashViewModel(),
      builder: (model) {
        model.startTimer();
        return Scaffold(
          backgroundColor: model.themeService.beigeThemed,
          body: Center(
            child: SvgPicture.asset(
              "assets/icons/book_logo.svg",
              width: 300,
              height: 300,
              color: model.themeService.blackThemed,
            ),
          ),
        );
      },
    );
  }
}
