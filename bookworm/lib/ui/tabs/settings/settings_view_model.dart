import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/datamodels/appearence.dart';
import 'package:bookworm/repositories/appearence_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/tabs/tabs.dart';
import 'package:get/get.dart';

class SettingsViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  final appearenceRepository = Get.find<AppearenceRepository>();

  double _scaleFactor = 1;
  double get scaleFactor => _scaleFactor;

  Future<void> updateScaleFactor(double newValue) async {
    _scaleFactor = newValue;
    final appearence = await appearenceRepository.getAppearence();
    appearenceRepository.clear();
    final newAppearence = AppearenceModel(
        languageCode: appearence.languageCode,
        scaleFactor: _scaleFactor,
        darkMode: appearence.darkMode);
    await appearenceRepository.saveAppearence(newAppearence);
    update();
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> updateDarkModeState(bool newState) async {
    themeService.setCurrentTheme(newState);
    final appearence = await appearenceRepository.getAppearence();
    appearenceRepository.clear();
    final newAppearence = AppearenceModel(
        languageCode: appearence.languageCode,
        scaleFactor: appearence.scaleFactor,
        darkMode: newState);
    await appearenceRepository.saveAppearence(newAppearence);
    BWTabBar.state.update();
    update();
  }
}
