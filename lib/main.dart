import 'package:contactapp/view/screens/contacts_screen.dart';
import 'package:contactapp/view/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 20, 21, 31),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 20, 21, 31),
        ),
        cardTheme: CardTheme(
          surfaceTintColor: Color.fromARGB(255, 33, 33, 37),
          color: Color.fromARGB(255, 33, 33, 37),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 20, 21, 31),
        useMaterial3: true,
      ),
      home: Navigation(),
    );
  }
}
