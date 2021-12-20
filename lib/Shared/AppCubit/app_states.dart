abstract class AppStates{}
class AppInitialState extends AppStates{}

class LoadingGetPrisonersDataState extends AppStates{}
class SuccessGetPrisonersDataState extends AppStates{}
class ErrorGetPrisonersDataState extends AppStates{
  final String error;
  ErrorGetPrisonersDataState(this.error);
}

class LoadingGetInnerPrisonersDataState extends AppStates{}
class SuccessGetInnerPrisonersDataState extends AppStates{}
class ErrorGetInnerPrisonersDataState extends AppStates{
  final String error;
  ErrorGetInnerPrisonersDataState(this.error);
}

class ChangeIndicatorSuccess extends AppStates{}

class ChangeNavBarItemsSuccess extends AppStates{}
