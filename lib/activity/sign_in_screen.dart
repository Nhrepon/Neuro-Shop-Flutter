import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:neuro_shop/activity/sign_up_screen.dart';
import 'package:neuro_shop/common/main_screen_with_bottom_navBar.dart';
import 'package:neuro_shop/controller/login_controller.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';
import 'package:neuro_shop/widgets/SnackBarMessage.dart';
import '../../../../app/app_colors.dart';
import '../../../../widgets/app_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = "/sign-in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Spacer(),
                  SizedBox(height: 100),
                  AppLogo(),
                  SizedBox(height: 16),
                  Text(
                    context.localization.welcomeBack,
                    style: textTheme.titleLarge,
                  ),
                  Text(
                    AppLocalizations.of(context)!.enterYourEmailAndPassword,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: context.localization.email,
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Email required";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: context.localization.password,
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Password required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  GetBuilder<LoginController>(
                    builder: (controller) {
                      return Visibility(
                        visible: _loginController.progress == false,
                        replacement: Center(child: CircularProgressIndicator(),),
                        child: ElevatedButton(
                          onPressed: () async {
                            if(_formKey.currentState!.validate()){

                              final bool response = await _loginController.login(_emailController.text.trim(), _passwordController.text);
                              if(response){
                                ShowSnackBarMessage(context, "Login success");
                                Navigator.pushNamedAndRemoveUntil(context, MainScreenWithBottomNavbar.name, (value)=>false);
                              }else{ShowSnackBarMessage(context, "Login failed");}
                            }
                            //FirebaseCrashlytics.instance.log("custom error message throsing...");
                            //throw Exception("test error");
                          },
                          child: Text(context.localization.signIn),
                        ),
                      );
                    }
                  ),
                  SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.themeColor,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = _onTapSignInButton,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
