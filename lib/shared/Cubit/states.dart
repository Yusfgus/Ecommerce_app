abstract class AppStates {}

class AppInitialStates extends AppStates{}

class AppChangeNavBarState extends AppStates {}

class AppChangeCategoryState extends AppStates {}

class AppItemClickedState extends AppStates {}

class GetDataFromApiSuccessState extends AppStates {}

class GetDataFromApiErrorState extends AppStates {
  final String error;
  GetDataFromApiErrorState(this.error);
}

class GetDataLoadingState extends AppStates {}

class AppTapBarItemClickedState extends AppStates {}

class AppImageClickedState extends AppStates {}

class AppFavouriteChangeState extends AppStates {}

class AppItemCountChangeState extends AppStates {}

class AppItemCountConditionState extends AppStates {}

class AppCheckedChangeState extends AppStates {}

class AppPasswordChangeState extends AppStates {}

class AppCheckedChangeRegState extends AppStates {}

class AppPasswordChangeRegState extends AppStates {}