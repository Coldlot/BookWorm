import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:get/get.dart';

class ReadingPageViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  void toggleToFavorites() {
    _isFavorite = !_isFavorite;
    update();
  }

  void dismiss() {
    Get.back();
  }
}
