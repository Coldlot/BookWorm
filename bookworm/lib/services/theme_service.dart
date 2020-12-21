import 'package:bookworm/res/res.dart';
import 'package:flutter/material.dart';

class BWThemeService {
  bool _isDarkMode;
  bool get isDarkMode => _isDarkMode;

  // ignore: avoid_positional_boolean_parameters
  BWThemeService(bool isDarkMode) {
    _isDarkMode = isDarkMode;
  }

  // ignore: use_setters_to_change_properties, avoid_positional_boolean_parameters
  void setCurrentTheme(bool isDarkMode) {
    _isDarkMode = isDarkMode;
  }

  // ignore: avoid_positional_boolean_parameters
  List<String> getNetworkImages() {
    if (_isDarkMode) {
      return [
        "assets/images/network_connection_man_dark.png",
        "assets/images/network_connection_dark.png"
      ];
    } else {
      return [
        "assets/images/network_connection_man.png",
        "assets/images/network_connection.png"
      ];
    }
  }

  List<String> getEmptyImages() {
    if (_isDarkMode) {
      return [
        "assets/images/binocular_dark.png",
        "assets/images/disco_dark.png",
        "assets/images/search_dark.png"
      ];
    } else {
      return [
        "assets/images/binocular.png",
        "assets/images/disco.png",
        "assets/images/search.png"
      ];
    }
  }

  Color get whiteThemed => BWColors.white;
  Color get beigeThemed => !_isDarkMode ? BWColors.beige : BWColors.dirtyBlue;
  Color get blackThemed => !_isDarkMode ? BWColors.black : BWColors.white;
  Color get redThemed => !_isDarkMode ? BWColors.red : BWColors.white;
  Color get peachThemed => !_isDarkMode ? BWColors.peach : BWColors.obsidian;
  Color get darkGreyThemed => !_isDarkMode ? BWColors.darkGray : BWColors.white;
  Color get darkBlueThemed => !_isDarkMode ? BWColors.darkBlue : BWColors.white;
  Color get darkBlueWithOpacityThemed =>
      !_isDarkMode ? BWColors.darkBlueWithOpacity : BWColors.whiteWithOpacity;
  Color get searchThemed =>
      !_isDarkMode ? BWColors.search : BWColors.whiteWithOpacity;

  Color get _textColor => !_isDarkMode ? BWColors.black : BWColors.white;

  TextStyle get headerStyleThemed =>
      BWStyle.headerStyle.copyWith(color: _textColor);
  TextStyle get mainTextStyleThemed =>
      BWStyle.mainTextStyle.copyWith(color: _textColor);
  TextStyle get nameOfBookThemed =>
      BWStyle.nameOfBook.copyWith(color: _textColor);
  TextStyle get smallButtonThemed =>
      BWStyle.smallButton.copyWith(color: _textColor);
  TextStyle get illustrationStyleThemed =>
      BWStyle.illustrationStyle.copyWith(color: _textColor);
  TextStyle get buttonTextStyleThemed =>
      BWStyle.buttonTextStyle.copyWith(color: _textColor);
  TextStyle get largeThemed => BWStyle.large.copyWith(color: _textColor);
}
