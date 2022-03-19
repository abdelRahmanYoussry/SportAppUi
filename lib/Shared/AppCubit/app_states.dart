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
class ChangeAutoPlayCarouselSuccess extends AppStates{
  final isPlaying;
  ChangeAutoPlayCarouselSuccess(this.isPlaying);
}
class LoadingGetSportsDataState extends AppStates{}
class SuccessGetSportsDataState extends AppStates{}
class ErrorGetSportsDataState extends AppStates{
  final String error;
  ErrorGetSportsDataState(this.error);
}

class LoadingGetGridviewSportsDataState extends AppStates{}
class SuccessGetGridviewSportsDataState extends AppStates{}
class ErrorGetGridviewSportsDataState extends AppStates{
  final String error;
  ErrorGetGridviewSportsDataState(this.error);
}
class LoadingChangeGridviewSportsDataState extends AppStates{}
class SuccessChangeGridviewSportsDataState extends AppStates{}
class ErrorChangeGridviewSportsDataState extends AppStates{
  final String error;
  ErrorChangeGridviewSportsDataState(this.error);
}
class LoadingPostRegDataState extends AppStates{}
class SuccessPostRegDataState extends AppStates{}
class ErrorPostRegDataState extends AppStates{
  final String error;
  ErrorPostRegDataState(this.error);
}