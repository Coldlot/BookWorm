import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:get/get.dart';

class SignInOutViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();

  String get image => themeService.isDarkMode
      ? "assets/images/man_with_ball_dark.png"
      : "assets/images/man_with_ball.png";

  bool _isSignIn = true;
  bool get isSignIn => _isSignIn;

  bool _hasError = false;
  // ignore: annotate_overrides
  bool get hasError => _hasError;
  void setHasError(String value) {
    _hasError = false;
    update();
  }

  void validate() {
    _isSignIn = false;
    update();
  }

  void submitCode() {
    _hasError = true;
    update();
  }

  void dismiss() {
    Get.back();
  }
}
