import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nemo_app/layout/Home%20Layout/HomeLayout.dart';
import 'package:nemo_app/modules/Home%20Page/HomePage.dart';
import 'package:nemo_app/modules/Splash%20screen/SplashScreen.dart';
import 'package:nemo_app/shared/constants/constants.dart';
import 'package:nemo_app/shared/observer.dart';
import 'package:http/http.dart' as http;


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
  ));
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
  getData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeLayout());
  }
}
