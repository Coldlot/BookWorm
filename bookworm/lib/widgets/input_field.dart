import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Key key;
  final TextStyle hintStyle;
  final String hintText;
  final Color color;
  final bool isPassword;
  final TextEditingController controller;

  const InputField(
      {@required this.color,
      @required this.key,
      @required this.hintStyle,
      @required this.hintText,
      @required this.controller,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: hintStyle,
      controller: controller,
      textAlign: TextAlign.center,
      obscureText: isPassword,
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
    );
  }
}
