import 'package:flutter/material.dart';
import 'package:neuro_shop/features/auth/ui/screens/splash_screen.dart';

class AppRoutes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    late Widget route;
    if(settings.name == "/"){
      route = SplashScreen();
    }
    return MaterialPageRoute(builder: (context){
      return route;
    });
  }
}