import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemo_app/modules/CartPage/CartPage.dart';
import 'package:nemo_app/modules/Favorite%20Page/FavoritePage.dart';
import 'package:nemo_app/modules/Home%20Page/HomePage.dart';
import 'package:nemo_app/shared/Cubit/states.dart';

import '../../modules/Profile Page/ProfilePage.dart';
import '../constants/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  //method to get a object
  static AppCubit get(context) => BlocProvider.of(context);

  // variables home page
  int currentIndex = 0;
  List<Widget> currentScreen = [
    const HomePage(),
    const CartPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];
  List<bool> itemSelected = [true, false, false, false, false, false];
  final List<String> categories = [
    'Smart Phones',
    'Laptops',
    'Home Decoration',
    'Skincare',
    'Fragrances',
    'Groceries',
  ];
  int selectedIndex = 0;
  int catIndex = 0;

  //Details page variables
  bool isTap = false;
  bool favorite = false;
  int itemCount = 1;
  int currentImage = 0;
  int max_items = 0;
  bool isPressed = false;
  bool isHighlighted = true;

  // Login page variables

  bool isPassword = true;
  bool isChecked = false;

  // Register page variables
  // var userControllerReg = TextEditingController();
  // var passControllerReg = TextEditingController();
  bool isPasswordReg = true;
  bool isCheckedReg = false;

  // functions home page

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeNavBarState());
  }

  void changeCategory(int index) {
    itemSelected = List.generate(6, (index) => false);
    itemSelected[index] = !itemSelected[index];
    emit(AppChangeCategoryState());
  }

  void itemClicked(int index) {
    print(index);
    emit(AppItemClickedState());
  }

  void getInfo() {
    emit(GetDataLoadingState());
    getData()
        .then((value) => {
              emit(GetDataFromApiSuccessState()),
            })
        .catchError((error) {
      print(error.toString());
      emit(GetDataFromApiErrorState(error.toString()));
    });
  }

  void tapBarItemClicked(int index) {
    catIndex = index;
    selectedIndex = index;
    emit(AppTapBarItemClickedState());
  }

  // Details page functions

  void imageClick(int index) {
    currentImage = index;
    isTap = true;
    emit(AppImageClickedState());
  }

  void favouriteChange() {
    favorite = !favorite;
    emit(AppFavouriteChangeState());
  }

  void itemCountChange() {
    if (itemCount != 1) itemCount--;
    emit(AppItemCountChangeState());
  }

  void itemCountCondition() {
    if (itemCount < max_items) itemCount++;
    emit(AppItemCountConditionState());
  }
  void isPressedClick()
  {
    isPressed = !isPressed;
    emit(AppIsPressedClickState());
  }
  void isHighlightedClick()
  {
    isHighlighted = !isHighlighted;
    emit(AppIsHighlightedClickState());
  }
  // login page functions
  void checkedChange(bool value) {
    isChecked = value;
    emit(AppCheckedChangeState());
  }

  void passwordChange() {
    isPassword = !isPassword;
    emit(AppPasswordChangeState());
  }
  //Register page functions
  void checkedChangeReg(bool value) {
    isCheckedReg = value;
    emit(AppCheckedChangeRegState());
  }

  void passwordChangeReg() {
    isPasswordReg = !isPasswordReg;
    emit(AppPasswordChangeRegState());
  }

}
