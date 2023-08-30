import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemo_app/modules/Home%20Page/HomePage.dart';
import 'package:nemo_app/modules/Login%20Page/LoginScreen.dart';
import 'package:nemo_app/modules/Register%20Screen/RegisterScreen.dart';
import 'package:nemo_app/modules/welcome%20Screen/WelcomeScreen.dart';
import 'package:nemo_app/shared/Cubit/states.dart';

import '../../modules/Profile Page/ProfilePage.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialStates());


  //method to get a object
  static AppCubit get(context) => BlocProvider.of(context);

  // variables
  int currentIndex = 0;
  List<Widget> currentScreen = [
    const HomePage(),
    const RegisterScreen(),
    const LoginScreen(),
    const ProfilePage(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeNavBarState());
  }
}