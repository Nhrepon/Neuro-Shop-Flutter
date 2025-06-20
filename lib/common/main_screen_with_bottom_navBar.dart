import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:neuro_shop/activity/cart_list_screen.dart';
import 'package:neuro_shop/activity/wish_list_screen.dart';
import 'package:neuro_shop/app/app_colors.dart';
import 'package:neuro_shop/controller/home_layout_controller.dart';
import 'package:neuro_shop/activity/category_list_screen.dart';
import 'package:neuro_shop/activity/home_screen.dart';
import 'package:neuro_shop/widgets/SnackBarMessage.dart';

import '../controller/category_controller.dart';
import '../controller/slider_controller.dart';

class MainScreenWithBottomNavbar extends StatefulWidget {
  const MainScreenWithBottomNavbar({super.key});

  static const String name = "/main-screen-with-bottom-navbar";

  @override
  State<MainScreenWithBottomNavbar> createState() =>
      _MainScreenWithBottomNavbarState();
}

class _MainScreenWithBottomNavbarState
    extends State<MainScreenWithBottomNavbar> {
  //int _selectedIndex = 0;.

  final List<Widget> _screen = [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    dataLoader();
    super.initState();
  }

  dataLoader(){
    Get.find<SliderController>().getSlider();
    Get.find<CategoryController>().getCategoryList();
  }

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
                  NavigationDestination(
                      icon: Icon(Icons.category), label: "Category"),
                  NavigationDestination(
                      icon: Icon(Icons.shopping_cart), label: "Cart"),
                  NavigationDestination(
                      icon: Icon(Icons.favorite_outline), label: "Wish list"),
                ]);
          }
      ),
      drawer: Drawer(child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: AppColors.themeColor),
                  accountName: Text("Nur Hossain Repon"),
                  accountEmail: Text("nurhossainrepon7248@gmail.com"),
                currentAccountPicture: Image.network("https://media.licdn.com/dms/image/v2/D4D03AQEyP6goZFKwwQ/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1703087850308?e=1752710400&v=beta&t=00Fkw8I12Qh_2bLreWyKzhNSrafEvt7ynJwlJyDnIhU",
                alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
                onDetailsPressed: (){ShowSnackBarMessage(context, "Profile details");},
              )
              // Center(
              //   child: Text("Neuro Shop",
              //   style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.themeColor),
              // ),)
          ),
              ListTile(leading: Icon(Icons.home), title: Text("Home"), onTap: () {},),
              ListTile(leading: Icon(Icons.person), title: Text("Blogs"), onTap: () {},),
              ListTile(leading: Icon(Icons.home), title: Text("Products"), onTap: () {},),
              ListTile(leading: Icon(Icons.home), title: Text("About"), onTap: () {},),
              ListTile(leading: Icon(Icons.home), title: Text("Contact"), onTap: () {},),
        ],
      ),),
    );
  }
}
