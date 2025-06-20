import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:neuro_shop/activity/sign_in_screen.dart';
import 'package:neuro_shop/common/main_screen_with_bottom_navBar.dart';
import 'package:neuro_shop/controller/auth_controller.dart';
import '../widgets/app_logo.dart';
import 'package:neuro_shop/app/app_configs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = "/";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final AuthController _authController = Get.find<AuthController>();

  Future<void> _moveToNextScreen()async{
    await Future.delayed(const Duration(seconds: 1));
    if(await _authController.isLogin()){
      Navigator.pushReplacementNamed(context, MainScreenWithBottomNavbar.name);
    }else{
      Navigator.pushReplacementNamed(context, SignInScreen.name);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    //_moveToNextScreen();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
      child: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height:16),
            Text(AppConfigs.currentAppVersion),
            Text(AppLocalizations.of(context)!.version)

          ],
        ),
      ),),
    );
  }
}


