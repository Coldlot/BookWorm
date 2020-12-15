import 'package:bookworm/app/getx_base_view_model.dart';

class SettingsViewModel extends GetxBaseViewModel {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  double _scaleFactor = 1;
  double get scaleFactor => _scaleFactor;

  void updateScaleFactor(double newValue) {
    _scaleFactor = newValue;
    update();
  }

  // ignore: avoid_positional_boolean_parameters
  void updateDarkModeState(bool newState) {
    _isDarkMode = newState;
    update();
  }
}
