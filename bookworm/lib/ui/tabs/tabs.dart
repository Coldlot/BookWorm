import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/tabs/settings/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'books/books_view.dart';
import 'favorites/favorites_view.dart';

final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

class BWTabBar extends StatefulWidget {
  static BWTabBarState state;
  @override
  State<StatefulWidget> createState() {
    // ignore: join_return_with_assignment
    state = BWTabBarState();
    return state;
  }
}

class BWTabBarState extends State<BWTabBar> {
  final themeService = Get.find<BWThemeService>();
  final controller = CupertinoTabController();

  void showIndex(int index) {
    setState(() {
      controller.index = index;
    });
  }

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: controller,
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(             
              'assets/icons/books.svg',
              color: themeService.blackThemed,
              key: Key('libTab'),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/booksActive.svg',
              color: themeService.blackThemed,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/favorite.svg',
              color: themeService.blackThemed,
              key: Key('favTab'),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/favoriteActive.svg',
              color: themeService.redThemed,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/settings.svg',
              color: themeService.blackThemed,
              key: Key('settingsTab'),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/settingActive.svg',
              color: themeService.blackThemed,
            ),
          ),
        ],
        backgroundColor: themeService.peachThemed,
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return CupertinoTabView(
            navigatorKey: firstTabNavKey,
            builder: (BuildContext context) => BooksView(),
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
