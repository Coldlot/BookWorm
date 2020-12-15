import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeSlider extends StatelessWidget {
  final double value;
  final Function(double) onChanged;

  final themeService = Get.find<BWThemeService>();

  SizeSlider({@required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('A', style: themeService.smallButtonThemed),
        Expanded(
          child: CupertinoSlider(
            activeColor: themeService.blackThemed,
            thumbColor: themeService.blackThemed,
            value: value,
            min: 0.5,
            max: 1.5,
            onChanged: onChanged,
          ),
        ),
        Text('A', style: themeService.largeThemed),
      ],
    );
  }
}
