import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../res/res.dart';

class EmptyPlaceholder extends StatelessWidget {
  final bool isInternetConnection;
  final Function onTap;
  EmptyPlaceholder({this.isInternetConnection = false, this.onTap});

  final List<String> _networkImages = [
    "assets/images/network_connection_man.png",
    "assets/images/network_connection.png"
  ];

  final List<String> _emptyImages = [
    "assets/images/binocular.png",
    "assets/images/disco.png",
    "assets/images/search.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
            isInternetConnection ? _networkImages.first : _emptyImages.first),
        const SizedBox(height: 20),
        Text(isInternetConnection ? S.of(context).networkConnection : S.of(context).emptyList, style: BWStyle.illustrationStyle),
        const SizedBox(height: 25),
        if (!isInternetConnection) OutlineButton(
          onPressed: onTap,
          child: Text(S.of(context).watchBooksList, style: BWStyle.buttonTextStyle,),
        ),
      ],
    );
  }
}
