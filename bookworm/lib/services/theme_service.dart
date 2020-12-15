enum BWTheme { light, dark }

class BWThemeService {
  BWTheme _currentTheme;
  BWTheme get currentTheme => _currentTheme;
  // ignore: use_setters_to_change_properties
  void setCurrentTheme(BWTheme theme) {
    _currentTheme = theme;
  }

  BWThemeService(BWTheme theme) {
    _currentTheme = theme;
  }
}
