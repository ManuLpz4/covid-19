import 'package:covid_19/src/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import 'package:outline_material_icons/outline_material_icons.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19'),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changePage,
        currentIndex: _currentIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(OMIcons.home),
            activeIcon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(OMIcons.newReleases),
            activeIcon: Icon(Icons.new_releases),
            title: Text(''),
          ),
        ],
      ),
    );
  }

  List<Widget> _pages = [
    HomePage(),
    Container(
      alignment: Alignment.center,
      child: Text('Feed'),
    ),
  ];

  void _changePage(int newValue) {
    if (newValue != _currentIndex)
      setState(
        () {
          _currentIndex = newValue;
        },
      );
  }
}
