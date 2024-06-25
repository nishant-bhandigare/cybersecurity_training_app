import 'package:cybersecurity_training_app/pages/discover.dart';
import 'package:cybersecurity_training_app/pages/gamezone.dart';
import 'package:cybersecurity_training_app/pages/home.dart';
import 'package:cybersecurity_training_app/pages/leaderboard.dart';
import 'package:cybersecurity_training_app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Discover(),
    const Gamezone(),
    const Leaderboard(),
    const Profile(
        name: "Alex Costa",
        username: "alexcosta350",
        followers: "34.2k",
        following: "851",
        streak: 50,
        totalXp: 5430,
        league: "Emerald"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color themeColour = const Color.fromARGB(255, 34, 50, 99);

    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: themeColour,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              _selectedIndex == 0
                  ? FontAwesomeIcons.diceD20
                  : FontAwesomeIcons.diceD20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              _selectedIndex == 1
                  ? FontAwesomeIcons.magnifyingGlass
                  : FontAwesomeIcons.magnifyingGlass,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              _selectedIndex == 2
                  ? FontAwesomeIcons.gamepad
                  : FontAwesomeIcons.gamepad,
            ),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              _selectedIndex == 3
                  ? FontAwesomeIcons.trophy
                  : FontAwesomeIcons.trophy,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              _selectedIndex == 4
                  ? FontAwesomeIcons.userSecret
                  : FontAwesomeIcons.userSecret,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
