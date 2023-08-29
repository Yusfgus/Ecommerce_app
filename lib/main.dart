import 'package:flutter/material.dart';
import 'package:nemo_app/modules/Register%20Screen/RegisterScreen.dart';
import 'package:nemo_app/modules/welcome%20Screen/WelcomeScreen.dart';
import 'modules/Splash screen/SplashScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home : SplashScreen());
  }
}
