import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:neuro_shop/app/app_colors.dart';
import 'package:neuro_shop/app/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neuro_shop/app/controller_binder.dart';
import 'package:neuro_shop/features/auth/ui/screens/sign_in_screen.dart';

class NeuroShop extends StatefulWidget {
  const NeuroShop({super.key});

  @override
  State<NeuroShop> createState() => _NeuroShopState();
}

class _NeuroShopState extends State<NeuroShop> {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.white),
        colorSchemeSeed: AppColors.themeColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.themeColor)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.themeColor)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          hintStyle: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: Colors.white,
            backgroundColor: AppColors.themeColor,
          )
        )
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('bn'), // Bangla
      ],      
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
    );
  }
}
