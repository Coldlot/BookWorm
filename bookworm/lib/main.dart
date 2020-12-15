import 'package:bookworm/ui/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';

import 'generated/l10n.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: SplashView(),
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale.fromSubtags(languageCode: "ru"),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
    ),
  );
}
