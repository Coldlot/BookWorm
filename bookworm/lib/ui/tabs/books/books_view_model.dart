import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:get/get.dart';

class BooksViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
}
