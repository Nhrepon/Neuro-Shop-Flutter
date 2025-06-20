import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:neuro_shop/app/app.dart';
import 'package:neuro_shop/firebase_options.dart';

void main()async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(const NeuroShop());
}

