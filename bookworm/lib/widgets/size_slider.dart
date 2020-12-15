import 'package:bookworm/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeSlider extends StatelessWidget {
  final double value;
  final Function(double) onChanged;

  const SizeSlider({@required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('A', style: BWStyle.smallButton),
        Expanded(
          child: CupertinoSlider(
            activeColor: Colors.black,
            thumbColor: Colors.black,
            value: value,
            min: 0.5,
            max: 1.5,
            onChanged: onChanged,
          ),
        ),
        const Text('A', style: TextStyle(fontSize: 32)),
      ],
    );
  }
}
