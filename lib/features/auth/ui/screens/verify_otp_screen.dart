import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';
import 'package:neuro_shop/features/auth/ui/screens/sign_up_screen.dart';
import 'package:neuro_shop/features/auth/ui/widgets/SnackBarMessage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../app/app_colors.dart';
import '../widgets/app_logo.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = "/verify-otp";

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  SizedBox(height: 32),
                  Text(context.localization.enterYourOtp,style: textTheme.titleLarge,),
                  Text(AppLocalizations.of(context)!.otpSend,style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 32),
                  _buildPinCodeTextField(),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        ShowSnackBarMessage(context, "Verify success");
                      }
                      //FirebaseCrashlytics.instance.log("custom error message throsing...");
                      //throw Exception("test error");
                    },
                    child: Text(context.localization.verify),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedColor: AppColors.themeColor,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _otpController,
      appContext: context,
      validator: (String? value){
        if(value?.isEmpty ?? true){
          return "Otp code required";
        }
        return null;
    },
    );
  }

  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _otpController.dispose();
  }
}
