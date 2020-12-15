import 'dart:async';

import 'package:bookworm/ui/tabs/tabs.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

import '../../app/getx_base_view_model.dart';

class SplashViewModel extends GetxBaseViewModel {
  @override
  Future<void> onInit() async {
    super.onInit();

    // Get.put(RestClient(Dio()));
    // Get.put(PersonsRepository());
  }

  void startTimer() {
    Timer(2.seconds, () => {Get.off(BWTabBar())});
  }
}
