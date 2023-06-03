import 'package:contactapp/view/screens/contacts_screen.dart';
import 'package:contactapp/view/screens/favorites_screen.dart';
import 'package:contactapp/view/screens/groups_screen.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

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
          title: Text(_titles[_selectedIndex]),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: Image(
                        image: AssetImage('assets/images/contacts.jpg'),
                      ).image,
                      backgroundColor: Colors.redAccent,
                    ),
                    Text(
                      'Contact App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Contacts'),
                onTap: () {
                  _pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.business),
                title: Text('Groups'),
                onTap: () {
                  _pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                  setState(() {
                    _selectedIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text('Favorites'),
                onTap: () {
                  _pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                  setState(() {
                    _selectedIndex = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
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
