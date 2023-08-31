import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemo_app/modules/Details%20Page/DetailsPage.dart';
import 'package:nemo_app/modules/Favorite%20Page/FavoritePage.dart';
import 'package:nemo_app/modules/Home%20Page/HomePage.dart';
import 'package:nemo_app/modules/Login%20Page/LoginScreen.dart';
import 'package:nemo_app/modules/Register%20Screen/RegisterScreen.dart';
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
    const DetailsPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  List<bool> itemSelected = [true, false, false, false, false, false];
  bool colort = false;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeNavBarState());
  }
  void changeCategory(int index) {
    itemSelected =
    List.generate(6, (index) => false);
    itemSelected[index] = !itemSelected[index];
    emit(AppChangeCategoryState());
  }

  void itemClicked(int index) {
    print(index);
    emit(AppItemClickedState());
  }
}