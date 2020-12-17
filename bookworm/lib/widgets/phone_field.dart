import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final TextStyle hintStyle;
  final String hintText;
  final Color color;

  const PhoneField(
      {@required this.color,
      @required this.hintStyle,
      @required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: hintStyle,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: color,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: color,
            width: 2,
          ),
        ),
        hintText: hintText,
        hintStyle: hintStyle,
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
