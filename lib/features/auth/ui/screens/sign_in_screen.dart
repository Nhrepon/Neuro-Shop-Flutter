import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';
import '../widgets/app_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = "/sign-in";
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              AppLogo(),
              SizedBox(height:16),
              Text(context.localization.welcomeBack, style:  textTheme.titleLarge,),
              Text(AppLocalizations.of(context)!.enterYourEmailAndPassword,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height:16),
              TextFormField(decoration: InputDecoration(hintText: context.localization.email),),
              SizedBox(height:16),
              TextFormField(decoration: InputDecoration(hintText: context.localization.password),),
              SizedBox(height:16),
              ElevatedButton(onPressed: (){throw Exception("test error");}, child: Text(context.localization.signIn)),
              Spacer(),
            ],
          ),
        ),),
    );
  }
}



