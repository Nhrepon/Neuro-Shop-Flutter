import 'package:flutter/material.dart';
import 'package:neuro_shop/app/app_routes.dart';


class NeuroShop extends StatefulWidget {
  const NeuroShop({super.key});

  @override
  State<NeuroShop> createState() => _NeuroShopState();
}

class _NeuroShopState extends State<NeuroShop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(),
      locale: Locale("en"),
    );
  }
}
