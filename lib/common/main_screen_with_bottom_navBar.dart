import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:neuro_shop/activity/cart_list_screen.dart';
import 'package:neuro_shop/activity/wish_list_screen.dart';
import 'package:neuro_shop/controller/home_layout_controller.dart';
import 'package:neuro_shop/activity/category_list_screen.dart';
import 'package:neuro_shop/home/home_screen.dart';

class MainScreenWithBottomNavbar extends StatefulWidget {
  const MainScreenWithBottomNavbar({super.key});
  static const String name = "/main-screen-with-bottom-navbar";
  @override
  State<MainScreenWithBottomNavbar> createState() => _MainScreenWithBottomNavbarState();
}

class _MainScreenWithBottomNavbarState extends State<MainScreenWithBottomNavbar> {
  //int _selectedIndex = 0;.

  final List<Widget> _screen = [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: GetBuilder<HomeLayoutController>(
        builder: (controller) {
          return _screen[controller.selectedIndex];
        }
      ),
      bottomNavigationBar: GetBuilder<HomeLayoutController>(
        builder: (controller) {
          return NavigationBar(
              selectedIndex: controller.selectedIndex,
              onDestinationSelected: controller.changeIndex,
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(icon: Icon(Icons.category), label: "Category"),
                NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Cart"),
                NavigationDestination(icon: Icon(Icons.favorite_outline), label: "Wish list"),
          ]);
        }
      ),
    );
  }
}
