import 'package:flutter/material.dart';
import 'package:neuro_shop/features/auth/ui/screens/splash_screen.dart';
import 'package:neuro_shop/features/auth/ui/screens/sign_in_screen.dart';

class AppRoutes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    late Widget route;
    if(settings.name == SplashScreen.name){
      route = const SplashScreen();
    }else if(settings.name == SignInScreen.name){
      route = const SignInScreen();
    }
    return MaterialPageRoute(builder: (context){
      return route;
    });
  }
}