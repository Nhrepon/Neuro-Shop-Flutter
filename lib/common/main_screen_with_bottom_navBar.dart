import 'package:flutter/material.dart';
import 'package:neuro_shop/home/home_screen.dart';

class MainScreenWithBottomNavbar extends StatefulWidget {
  const MainScreenWithBottomNavbar({super.key});
  static const String name = "/main-screen-with-bottom-navbar";
  @override
  State<MainScreenWithBottomNavbar> createState() => _MainScreenWithBottomNavbarState();
}

class _MainScreenWithBottomNavbarState extends State<MainScreenWithBottomNavbar> {
  int _selectedIndex = 0;
  final List<Widget> _screen = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index){
            _selectedIndex = index;
          setState(() {});
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.category), label: "Category"),
            NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Cart"),
            NavigationDestination(icon: Icon(Icons.favorite_outline), label: "Wish list"),
      ]),
    );
  }
}
