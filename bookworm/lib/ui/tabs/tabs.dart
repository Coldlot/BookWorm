import 'package:bookworm/ui/tabs/settings/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/res.dart';
import 'books/books_view.dart';
import 'favorites/favorites_view.dart';

final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

class BWTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
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
