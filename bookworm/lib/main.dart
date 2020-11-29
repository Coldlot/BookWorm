import 'package:bookworm/ui/splash/books_view.dart';
import 'package:bookworm/ui/splash/favorites_view.dart';
import 'package:bookworm/ui/splash/settings_view.dart';
import 'package:bookworm/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:bookworm/res/res.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
void main() {
  runApp(
    new CupertinoApp(
      home: new MyApp(),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
],
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/books.svg'),
                activeIcon: SvgPicture.asset('assets/icons/booksActive.svg')),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/favorite.svg'),
                activeIcon: SvgPicture.asset('assets/icons/favoriteActive.svg')),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/settings.svg'),
                activeIcon: SvgPicture.asset('assets/icons/settingActive.svg')),
          ],
          backgroundColor: BWColors.peach,
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return CupertinoTabView(
            navigatorKey: firstTabNavKey,
            builder: (BuildContext context) => SplashView(),
          );
        } else if (index == 1) {
          return CupertinoTabView(
            navigatorKey: secondTabNavKey,
            builder: (BuildContext context) => FavoritesView(),
          );
        } else {
          return CupertinoTabView(
            navigatorKey: thirdTabNavKey,
            builder: (BuildContext context) => SettingsView(),
          );
        } 
      },
    );
  }
}


