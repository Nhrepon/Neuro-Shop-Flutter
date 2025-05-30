
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:neuro_shop/activity/sign_in_screen.dart';
import 'package:neuro_shop/controller/verify_otp_controller.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';
import 'package:neuro_shop/model/verify_otp_model.dart';
import 'package:neuro_shop/widgets/SnackBarMessage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../app/app_colors.dart';
import '../../../../widgets/app_logo.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});
  final String email;
  static const String name = "/verify-otp";

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VerifyOtpController _verifyOtpController = Get.find<VerifyOtpController>();

  late RxInt _currentTime;
  void _startTimer(){
    _currentTime = 30.obs;
    Timer.periodic(Duration(seconds: 1), (timer){
      if(_currentTime.value == 0){
        timer.cancel();
      }else{
        _currentTime.value --;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _startTimer();
    super.initState();
  }

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
                    onPressed: ()async{
                      if(_formKey.currentState!.validate()){
                        VerifyOtpModel verifyOtpModel = VerifyOtpModel(email: widget.email, otp: _otpController.text);
                        final bool response = await _verifyOtpController.verifyOtp(verifyOtpModel);
                        if(response){
                          ShowSnackBarMessage(context, _verifyOtpController.message!);
                          Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate)=>false);
                        }else{
                          ShowSnackBarMessage(context, _verifyOtpController.message!);
                        }
                      }
                      //FirebaseCrashlytics.instance.log("custom error message throsing...");
                      //throw Exception("test error");
                    },
                    child: Text(context.localization.verify),
                  ),
                  const SizedBox(height: 16,),
                  Obx(() {
                      return Column(
                        children: [
                          Visibility(visible:_currentTime.value == 0, child: TextButton(onPressed: (){setState(() {_startTimer();});}, child: Text("Resend otp"))),
                          Visibility(visible:_currentTime.value != 0, child: TextButton(onPressed: (){}, child: Text("Resend otp in ${_currentTime.value}"))),
                        ],
                      );
                    }
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


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _otpController.dispose();
  }
}
