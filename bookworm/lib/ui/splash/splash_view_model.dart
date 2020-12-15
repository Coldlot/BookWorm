import 'dart:async';

import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/tabs/tabs.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

import '../../app/getx_base_view_model.dart';

class SplashViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  bool get isDarkMode => themeService.isDarkMode;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void startTimer() {
    Timer(3.seconds, () => {Get.off(BWTabBar())});
  }
}
