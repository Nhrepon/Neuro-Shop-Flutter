import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neuro_shop/app/app_colors.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neuro_shop/features/auth/ui/screens/sign_in_screen.dart';
import 'package:neuro_shop/features/auth/ui/screens/verify_otp_screen.dart';

import '../widgets/SnackBarMessage.dart';
import '../widgets/app_logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = "/sign-up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                AppLogo(),
                SizedBox(height: 16),
                Text(
                  context.localization.createAccount,
                  style: textTheme.titleLarge,
                ),
                Text(
                  AppLocalizations.of(context)!.getStarted,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: context.localization.email,
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Email required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _firstNameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localization.firstName,
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "First name required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _lastNameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localization.lastName,
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Last name required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: context.localization.phone,
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Phone number required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: context.localization.address,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Address required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: context.localization.password,
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Password required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ShowSnackBarMessage(context, "Sign up success");
                    }
                    Navigator.pushNamed(context, VerifyOtpScreen.name);
                  },
                  child: Text(context.localization.signUp),
                ),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.themeColor,
                        ),
                        recognizer:
                            TapGestureRecognizer()..onTap = _onTapSingInButton,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSingInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
  }
}
