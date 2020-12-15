part of 'res.dart';

class BWStyle {
  static TextStyle create(
          {String fontFamily,
          double fontSize,
          FontWeight fontWeight,
          FontStyle fontStyle,
          Color color,
          double height,
          double laterSpacing}) =>
      TextStyle(
          fontFamily: fontFamily ?? 'Roboto',
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color ?? BWColors.white,
          height: height,
          letterSpacing: laterSpacing);

  static TextStyle headerStyle =
      create(fontSize: 17, color: BWColors.black, laterSpacing: 1.25);
  static TextStyle mainTextStyle = create(fontSize: 17, color: BWColors.black);
  static TextStyle nameOfBook = create(fontSize: 15, color: BWColors.black);
  static TextStyle smallButton = create(fontSize: 12, color: BWColors.black);
  static TextStyle illustrationStyle =
      create(fontSize: 15, color: BWColors.black, laterSpacing: 1.25);
  static TextStyle buttonTextStyle =
      create(fontSize: 12, color: BWColors.black, laterSpacing: 1.25);
  static TextStyle large =
      create(fontSize: 32, color: BWColors.black, laterSpacing: 1.25);
}
