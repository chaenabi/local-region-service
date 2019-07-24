import 'package:flutter/material.dart';

import './status.dart';
import './map.dart';
import './home.dart';

class TabPage extends StatefulWidget {
 // final FirebaseUser user;
  TabPage();

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  List _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(),
      StatusPage(),
      MapPage(),  
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility), title: Text('Current Status')),
            BottomNavigationBarItem(
                icon: Icon(Icons.map),
                title: Text('Map Card')),
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
