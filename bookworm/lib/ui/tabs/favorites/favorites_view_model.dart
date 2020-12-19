import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/repositories/favorite_book_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/tabs/tabs.dart';
import 'package:get/get.dart';

class FavoritesViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  final favoritesRepository = Get.find<FavoriteBooksRepository>();


  void showBooksList() {
    BWTabBar.state.showIndex(0);
  }
}
