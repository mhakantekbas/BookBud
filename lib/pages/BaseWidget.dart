import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:term_project/Provider/ThemeProvider.dart';
import 'package:term_project/pages/search_page.dart';
import 'package:term_project/pages/setting_page.dart';

import 'BookListPage.dart';
import 'MyListPage.dart';
import 'ProfilePage.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/baseWidget-page';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _index = 1;
  final List<Widget> screens = [
    MyListPage(),
    BookPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[_index],
      bottomNavigationBar: CurvedNavigationBar(
        index: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        animationDuration: const Duration(milliseconds: 350),
        color: const Color.fromRGBO(53, 83, 88, 1),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Color.fromARGB(255, 48, 48, 48)
            : Colors.white,
        items: const [
          Icon(
            Icons.list_alt_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
