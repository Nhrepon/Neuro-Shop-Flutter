import 'package:flutter/material.dart';
import 'package:neuro_shop/activity/cart_list_screen.dart';
import 'package:neuro_shop/activity/product_details_screen.dart';
import 'package:neuro_shop/activity/product_list_screen.dart';
import 'package:neuro_shop/activity/wish_list_screen.dart';
import 'package:neuro_shop/common/main_screen_with_bottom_navBar.dart';
import 'package:neuro_shop/model/category_model.dart';

import '../activity/sign_in_screen.dart';
import '../activity/sign_up_screen.dart';
import '../activity/splash_screen.dart';
import '../activity/verify_otp_screen.dart';

class AppRoutes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    late Widget route;
    if(settings.name == SplashScreen.name){
      route = SplashScreen();
    }else if(settings.name == SignInScreen.name){
      route = const SignInScreen();
    }else if(settings.name == SignUpScreen.name){
      route = const SignUpScreen();
    }else if(settings.name == VerifyOtpScreen.name){
      String email = settings.arguments as String;
      route = VerifyOtpScreen(email: email);
    }else if(settings.name == MainScreenWithBottomNavbar.name){
      route = const MainScreenWithBottomNavbar();
    }else if(settings.name == ProductListScreen.name){
      final category = settings.arguments as CategoryModel;
      route = ProductListScreen(category: category,);
    }else if(settings.name == ProductDetailsScreen.name){
      route = ProductDetailsScreen();
    }else if(settings.name == WishListScreen.name){
      route = const WishListScreen();
    }else if(settings.name == CartListScreen.name){
      route = const CartListScreen();
    }



    return MaterialPageRoute(builder: (context){
      return route;
    });
  }
}