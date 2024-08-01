import 'package:flutter/material.dart';
import 'package:food_app/pages/home.dart';
import 'package:food_app/pages/profile.dart';
import 'package:food_app/pages/browse.dart';
import 'package:food_app/pages/menu.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
  

  

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    BrowsePage(),
    MenuPage(),
    ProfilePage(),
    
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          //the theme when changed changes globally
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          fontFamily: 'Poppins'
        ),
      //removing the red debug banner
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceDim,
        body: _pages[_selectedIndex],
        bottomNavigationBar: _bottomNavigationBar()
        )
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
        items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',),
          BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Browse',),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,//fits all items in the navigation bar 
        selectedLabelStyle: TextStyle(color: Colors.amber[800]), // Set the selected label color
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        );
  }
}

