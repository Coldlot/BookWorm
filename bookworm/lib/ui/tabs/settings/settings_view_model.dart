import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/datamodels/appearence.dart';
import 'package:bookworm/repositories/appearence_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/tabs/settings/languages/languages_view.dart';
import 'package:bookworm/ui/tabs/tabs.dart';
import 'package:get/get.dart';

class SettingsViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  final appearenceRepository = Get.find<AppearenceRepository>();

  double _currentScaleFactor;
  double get currentScaleFactor => _currentScaleFactor;

  @override
  Future<void> onInit() async {
    super.onInit();
    await receiveScaleFactor();
  }

  void updateCurrentScaleFactor(double newValue) {
    _currentScaleFactor = newValue;
    update();
  }

  Future<void> receiveScaleFactor() async {
    setBusy(true);
    _currentScaleFactor =
        (await appearenceRepository.getAppearence()).scaleFactor;
    setBusy(false);
    update();
  }

  Future<void> updateScaleFactor(double newValue) async {
    final appearence = await appearenceRepository.getAppearence();
    appearenceRepository.clear();
    final newAppearence = AppearenceModel(
        languageCode: appearence.languageCode,
        scaleFactor: newValue,
        darkMode: appearence.darkMode);
    await appearenceRepository.saveAppearence(newAppearence);
    _currentScaleFactor = newValue;
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

  void showLocaleSelection() {
    Get.to(LanguagesView());
  }
}
