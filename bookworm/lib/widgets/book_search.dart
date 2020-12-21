import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: BoxDecoration(
        color: const Color(0xFF979797).withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      prefix: const Icon(Icons.search),
      suffix: const Icon(Icons.clear),
      placeholder: S.of(context).search,
      placeholderStyle: BWStyle.headerStyle,
      onSubmitted: (value) {},
    );
  }
}
