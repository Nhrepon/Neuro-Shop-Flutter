import 'package:flutter/material.dart';
import 'package:neuro_shop/common/main_screen_with_bottom_navBar.dart';
import 'package:neuro_shop/features/auth/ui/screens/sign_up_screen.dart';
import 'package:neuro_shop/features/auth/ui/screens/splash_screen.dart';
import 'package:neuro_shop/features/auth/ui/screens/sign_in_screen.dart';
import 'package:neuro_shop/features/auth/ui/screens/verify_otp_screen.dart';

class AppRoutes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    late Widget route;
    if(settings.name == SplashScreen.name){
      route = const SplashScreen();
    }else if(settings.name == SignInScreen.name){
      route = const SignInScreen();
    }else if(settings.name == SignUpScreen.name){
      route = const SignUpScreen();
    }else if(settings.name == VerifyOtpScreen.name){
      route = const VerifyOtpScreen();
    }else if(settings.name == MainScreenWithBottomNavbar.name){
      route = const MainScreenWithBottomNavbar();
    }



    return MaterialPageRoute(builder: (context){
      return route;
    });
  }
}