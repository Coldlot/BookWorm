import 'package:flutter/material.dart';
import 'package:bookworm/res/res.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int tabIndex;

  const AppBottomNavigationBar({Key key, this.tabIndex}) : super(key: key);

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _cIndex = 0;

  @override
  void initState() {
    super.initState();
    _cIndex = widget.tabIndex;
  }

  void _selectTab(int index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _cIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: BWColors.peach,
      // selectedItemColor: BWColors.blue,
      // selectedLabelStyle: BWStyle.grey12,
      // unselectedItemColor: BWColors.grey,
      items: const [
        BottomNavigationBarItem(
          activeIcon: ImageIcon(
            AssetImage('assets/icons/books.svg'),
            //color: BWColors.blue,
          ),
          icon: ImageIcon(
            AssetImage('assets/icons/booksActive.svg'),
            //color: BWColors.grey,
          ),
          label: 'Новый анализ',
        ),
        BottomNavigationBarItem(
          activeIcon: ImageIcon(
            AssetImage('assets/icons/favorite.svg'),
            //color: BWColors.blue,
          ),
          icon: ImageIcon(
            AssetImage('assets/icons/favoriteActive.svg'),
            //color: BWColors.grey,
          ),
          label: 'Merlinface',
        ),
        BottomNavigationBarItem(
          activeIcon: ImageIcon(
            AssetImage('assets/icons/properties.svg'),
            //color: BWColors.blue,
          ),
          icon: ImageIcon(
            AssetImage('assets/icons/propertiesActive.svg'),
          ),
          label: 'Профиль',
        ),
      ],
      onTap: _selectTab,
    );
  }
}
