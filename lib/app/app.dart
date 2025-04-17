import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:neuro_shop/app/app_colors.dart';
import 'package:neuro_shop/app/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neuro_shop/features/auth/ui/screens/sign_in_screen.dart';

class NeuroShop extends StatefulWidget {
  const NeuroShop({super.key});

  @override
  State<NeuroShop> createState() => _NeuroShopState();
}

class _NeuroShopState extends State<NeuroShop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SignInScreen.name,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('en'),
      supportedLocales: [
        Locale('en'), // English
        Locale('bn'), // Bangla
      ],

    );
  }
}
