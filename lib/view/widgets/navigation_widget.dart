import 'package:contactapp/view/screens/contacts_screen.dart';
import 'package:contactapp/view/screens/favorites_screen.dart';
import 'package:contactapp/view/screens/groups_screen.dart';
import 'package:contactapp/view/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/services/user_provider.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  bool isLoading = false;

  final List<Widget> _screens = const [
    ContactScreen(),
    GrouopScreen(),
    FavoriteScreen(),
  ];

  final List<String> _titles = const [
    'Contacts',
    'Groups',
    'Favorites',
  ];

  @override
  void initState() {
    super.initState();
    addData();
    _pageController = PageController(initialPage: 2);
  }

  addData() async {
    setState(() {
      isLoading = true;
    });
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titles[_selectedIndex]),
        ),
        drawer: const NavDrawer(),
        body: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.redAccent,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
