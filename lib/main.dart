import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nemo_app/layout/Home%20Layout/HomeLayout.dart';
import 'package:nemo_app/modules/Register%20Screen/RegisterScreen.dart';
import 'package:nemo_app/modules/welcome%20Screen/WelcomeScreen.dart';
import 'package:nemo_app/shared/observer.dart';
import 'modules/Splash screen/SplashScreen.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home : HomeLayout());
  }
}
