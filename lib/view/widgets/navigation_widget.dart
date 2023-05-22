import 'package:contactapp/view/screens/contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        body: ContactScreen(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Groups',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Favorites',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.redAccent,
          onTap: (index) {},
        ));
  }
}
