import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'index.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void _onItemTapped(int index) {
    print('_onItemTapped: ${context.vRouter.url} $index');
    if (PageTabRouting.pageRoutes.keys.contains(index)) {
      MapEntry route = PageTabRouting.pageRoutes.entries
          .firstWhere((element) => element.key == index);

      print('_onItemTapped found:${route}');
      context.vRouter.to(route.value);
    }
  }

  int _getSelectedIndex() {
    if (PageTabRouting.pageRoutes.values.contains(context.vRouter.url)) {
      MapEntry route = PageTabRouting.pageRoutes.entries
          .firstWhere((element) => element.value == context.vRouter.url);
      return route.key;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: bottomNavigationItems,
      currentIndex: _getSelectedIndex(),
      onTap: _onItemTapped,
    );
  }

  List<BottomNavigationBarItem> bottomNavigationItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: 'favorites'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.summarize), label: 'summary'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
  ];
}
