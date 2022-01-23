// ignore_for_file: deprecated_member_use, non_constant_identifier_names, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:twinku/Screens/Create_post.dart';
import 'package:twinku/Screens/Details.dart';
import 'package:twinku/Screens/Edit_post.dart';
import 'package:twinku/Screens/Home.dart';
import 'package:twinku/Screens/Homes/Users.dart';

class ButtomBar extends StatefulWidget {
  ButtomBar({Key? key}) : super(key: key);

  @override
  _ButtomBar createState() => _ButtomBar();
}

class _ButtomBar extends State<ButtomBar> {
  // List _pages = [
  //   Home(),
  //   Feeds(),
  //   Search(),
  //   Carts(),
  //   Users(),
  // ];
  late List<Map<String, Object>> _pages;
  int _selectedindex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': HomePage(),
        'title': "HomePage",
      },
      {
        'page': EditPost(),
        'title': "Search",
      },
      {
        'page': CreatPost(),
        'title': "CreatePost",
      },
      {
        'page': Details(),
        'title': "Saved",
      },
      {
        'page': AccounPage(),
        'title': "Profile",
      },
    ];
    super.initState();
  }

  void _SelectedPage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedindex]['page'] as Widget,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 2,
          clipBehavior: Clip.antiAlias,
          shape: CircularNotchedRectangle(),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.5),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _SelectedPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Colors.blue,
              currentIndex: _selectedindex,
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  tooltip: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search",
                  tooltip: "Search",
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  label: "Create post",
                  tooltip: "Create post",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.save),
                  label: "Saved",
                  tooltip: "Saved",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                  tooltip: "Profile",
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: "Add",
            backgroundColor: Colors.blue,
            onPressed: () {
              setState(() {
                _selectedindex = 2;
              });
            },
          ),
        ),
      ),
    );
  }

  Feeds() {}
}

class Home {}
