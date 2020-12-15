import 'package:bookworm/res/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemRow extends StatelessWidget {
  final Widget trailing;
  final String icon;
  final String text;
  final Function onTap;
  final Color color;

  const ItemRow({
    @required this.icon,
    @required this.text,
    this.trailing = const Icon(
      Icons.arrow_forward_ios,
      size: 20,
    ),
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icon,
              width: 30, height: 30, color: color ?? BWColors.darkGray),
          const SizedBox(width: 15),
          Text(text, style: BWStyle.headerStyle),
          const Spacer(),
          trailing,
        ],
      ),
    );
  }
}
