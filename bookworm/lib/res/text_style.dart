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

  // static TextStyle action = create(
  //     fontSize: 16,
  //     fontWeight: FontWeight.w600,
  //     color: const Color(0xFFA7A7A7));
  // static TextStyle actionInfoTitle = create(
  //     fontSize: 15,
  //     fontWeight: FontWeight.bold,
  //     color: const Color(0xFFFFFFFF));
  // static TextStyle actionInfoDesc =
  //     create(fontSize: 14, color: Colors.white.withOpacity(0.7));

  // static TextStyle analysisName =
  //     create(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white);
  // static TextStyle analysisSource = create(
  //     fontSize: 12,
  //     fontWeight: FontWeight.bold,
  //     color: BWColors.analysisDescColor);
  // static TextStyle analysisDate =
  //     create(fontSize: 16, color: BWColors.analysisDescColor);
  // static TextStyle analysisYear =
  //     create(fontSize: 12, color: BWColors.analysisYearColor);

  // static TextStyle lightGold21 = create(
  //     fontSize: 21, color: BWColors.lightGold, fontWeight: FontWeight.w600);
  // static TextStyle lightGold16 = create(fontSize: 16, color: BWColors.lightGold);
  // static TextStyle lightGold14 = create(fontSize: 14, color: BWColors.lightGold);

  // static TextStyle white27 = create(fontSize: 27, color: BWColors.white);
  // static TextStyle white24 = create(fontSize: 24, color: BWColors.white);
  // static TextStyle white20 =
  //     create(fontSize: 20, color: BWColors.white, fontWeight: FontWeight.w600);
  // static TextStyle white18 = create(fontSize: 18, color: BWColors.white);
  // static TextStyle white16 = create(fontSize: 16, color: BWColors.white);
  // static TextStyle white14 = create(fontSize: 14, color: BWColors.white);
  // static TextStyle white14b = create(
  //     fontSize: 14,
  //     height: 18 / 14,
  //     color: BWColors.white,
  //     fontWeight: FontWeight.bold);

  // static TextStyle grey16 = create(fontSize: 16, color: BWColors.grey);
  // static TextStyle grey12 = create(fontSize: 12, color: BWColors.grey);

  // static TextStyle green16 = create(fontSize: 16, color: BWColors.green);
  // static TextStyle green20 = create(fontSize: 20, color: BWColors.green);

  // static const TextStyle errorMessage = TextStyle(
  //   fontSize: 16,
  //   height: 30 / 16,
  //   color: BWColors.lightGold,
  // );
}
