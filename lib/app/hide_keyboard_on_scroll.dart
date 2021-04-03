import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

bool hideKeyboard(Notification notification) {
  if (notification is ScrollUpdateNotification) {
    if (notification.scrollDelta < -10 && notification.dragDetails != null) {
      FocusScope.of(Get.overlayContext).unfocus();
    }
  }
  return null;
}