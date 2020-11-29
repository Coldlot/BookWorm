import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

class Utils {
  static String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  static String fourDigits(int n) {
    final int absN = n.abs();
    final String sign = n < 0 ? '-' : '';
    if (absN >= 1000) return '$n';
    if (absN >= 100) return '${sign}0$absN';
    if (absN >= 10) return '${sign}00$absN';
    return '${sign}000$absN';
  }

  static DateTime dayOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static String getDateTimeNow([DateTime dateTime]) {
    final DateTime now = dateTime ?? DateTime.now();
    return '${fourDigits(now.year)}'
        '-${twoDigits(now.month)}'
        '-${twoDigits(now.day)}'
        ' '
        '${twoDigits(now.hour)}'
        ':${twoDigits(now.minute)}'
        ':${twoDigits(now.second)}';
  }

  static String getDateTime({DateTime dateTime, String stringTime}) {
    final DateTime time = dateTime ?? DateTime.parse(stringTime);
    return '${twoDigits(time.day)}'
        '.${twoDigits(time.month)}'
        '.${fourDigits(time.year)}';
  }

  static String getHourMinuteString(dynamic dateTime) {
    if (dateTime is String) dateTime = DateTime.parse(dateTime as String);
    if (dateTime is! DateTime) return '';
    return '${twoDigits(dateTime.hour as int)}:${twoDigits(dateTime.minute as int)}';
  }

  static Stack buildBlurredContainer(
    Widget backgroundWidget, {
    BoxConstraints constraints = const BoxConstraints.expand(),
    double sigma = 10.0,
  }) {
    return Stack(
      children: <Widget>[
        Container(constraints: constraints, child: backgroundWidget),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
            child: Stack(
              children: <Widget>[
                Container(
                  constraints: constraints,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.1)),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  static String getNoun(int number, String one, String two, String five) {
    number = number.abs();
    number %= 100;
    if (number >= 5 && number <= 20) {
      return five;
    }
    number %= 10;
    if (number == 1) {
      return one;
    }
    if (number >= 2 && number <= 4) {
      return two;
    }
    return five;
  }

  static String getPan(String panString) {
    if (panString == '') return '';
    final List<String> pan = panString.split('*');
    final List<String> endPan = <String>[];
    endPan.add(pan[0][0] + pan[0][1] + pan[0][2] + pan[0][3]);
    endPan.add('${pan[0][0]}${pan[0][1]}XXXXXX');
    endPan.add(pan.last[0] + pan.last[1] + pan.last[2] + pan.last[3]);
    return endPan.join();
  }

  static String formatPhoneNumber(String phone) {
    return '${phone.substring(0, 2)} (${phone.substring(2, 5)}) ${phone.substring(5, 8)}-${phone.substring(8, 10)}-${phone.substring(10)}';
  }

  static String getNormalPrice(double price) {
    price = (price * 10).truncate() / 10;
    final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    return price.toString().replaceAll(regex, '');
  }

  static bool isValidMd5(String md5) {
    return RegExp(r'(^[a-f0-9]{32}$)').hasMatch(md5);
  }
}
