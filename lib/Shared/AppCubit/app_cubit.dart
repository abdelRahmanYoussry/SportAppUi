import 'package:adham_tasks/Shared/AppCubit/app_states.dart';
import 'package:adham_tasks/Task1/inner_prisoner_model.dart';
import 'package:adham_tasks/Task2/Club.dart';
import 'package:adham_tasks/Task2/SettingScreen.dart';
import 'package:adham_tasks/Task2/categories.dart';
import 'package:adham_tasks/Task2/profile_1.dart';
import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../dio_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  List<dynamic> prisonersList=[];
  List<dynamic> sportsList=[];
  List<dynamic> gridviewSportsList=[];
 //  late VideoPlayerController _videoPlayerController1=VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
 //  late VideoPlayerController _videoPlayerController2=VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
late ChewieController chewieController1;
 late ChewieController chewieController2;
  late VideoPlayerController _videoPlayerController;
  late VideoPlayerController _videoPlayerController1;
 List<String>videoList=[
   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
   'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
 ];

  void getPrisonersData(){
    emit(LoadingGetPrisonersDataState());
    DioHelper.getData(path: '/v1/cases?caseStatus=2').then((value) {
      emit(SuccessGetPrisonersDataState());
      prisonersList=value.data['model'];
    })
        .catchError((error){
        print(error.toString());
      emit(ErrorGetPrisonersDataState(error.toString()));

    });

  }

  void getSportsData(){
    emit(LoadingGetSportsDataState());
    DioHelper.getData(path: 'sport').then((value) {
      sportsList=value.data['sports'];
      emit(SuccessGetSportsDataState());
      // print(sportsList[1]);
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetSportsDataState(error));
    });
  }
  void getGridviewSportsData(){
    emit(LoadingGetGridviewSportsDataState());
    DioHelper.getData(path: 'role').then((value) {
      gridviewSportsList=value.data;
      emit(SuccessGetGridviewSportsDataState());
      print(gridviewSportsList[index]['user_count']);
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetGridviewSportsDataState(error));
    });
  }

  void changeGridviewSportsData({sportItemId}){
    emit(LoadingChangeGridviewSportsDataState());
    DioHelper.getData(path: 'role?sport_id=$sportItemId').then((value) {
      gridviewSportsList=value.data;
      emit(SuccessChangeGridviewSportsDataState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorChangeGridviewSportsDataState(error));
    });
  }

  late Map<String,dynamic>  innerPrisonersList;
  InnerModel? model;

  void getInnerPrisonersData(){
    emit(LoadingGetInnerPrisonersDataState());
    DioHelper.getData(path: 'v1/cases/55').then((value) {
      emit(SuccessGetInnerPrisonersDataState());
     model=InnerModel.fromJson(value.data);
    })
        .catchError((error){
          print(error.toString());
      emit(ErrorGetInnerPrisonersDataState(error.toString()));

    });
  }

  int index=0;
  void changeIndicator(int indicatorIndex){
    index=indicatorIndex;
    emit(ChangeIndicatorSuccess());
  }


int currentIndex=3;
  void changeNavBar(int index){
    currentIndex=index;
    emit(ChangeNavBarItemsSuccess());
  }

List<Widget>screenList=[
  SettingScreen(),
  CategoriesScreen(),
  ClubScreen(),
  SportProfileScreen(),
];

  List<BottomNavigationBarItem> bottomNavItem=[
    BottomNavigationBarItem(icon: Icon(Icons.settings,size: 30,),label: '',),
    BottomNavigationBarItem(icon: Icon(Icons.grid_view,size: 30,),label: '',),
    BottomNavigationBarItem(icon: Icon(Icons.person,size: 30,),label: '',),
    BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label: '',),
  ];

// void videoPlayer(){
//   chewieController1=ChewieController(
//       videoPlayerController: _videoPlayerController1,
//      autoInitialize: true,
//     fullScreenByDefault: false,
//     autoPlay: false,
//     aspectRatio: 16/9,
//     allowedScreenSleep: false,
//   );
// }
//   void videoPlayer1(){
//     chewieController2=ChewieController(
//       videoPlayerController: _videoPlayerController2,
//       autoInitialize: true,
//       fullScreenByDefault: false,
//       autoPlay: false,
//       aspectRatio: 16/9,
//       allowedScreenSleep: false,
//
//     );
//
// }
 Future <void> showVideos() async{
_videoPlayerController=VideoPlayerController.network(videoList[0]);
_videoPlayerController1=VideoPlayerController.network(videoList[1]);
chewieController1=ChewieController(
    videoPlayerController: _videoPlayerController,
    autoInitialize: true,
    fullScreenByDefault: false,
    autoPlay: false,
    aspectRatio: 16/9,
    allowedScreenSleep: false,
  materialProgressColors: ChewieProgressColors(
    playedColor: Colors.red,
    backgroundColor: Colors.white,
    bufferedColor: Colors.deepPurple,
  ),
  allowMuting: true,
  allowFullScreen: true,
  allowPlaybackSpeedChanging: true,
  looping: true,
  placeholder: Container(
    color: Colors.transparent,
  )
);
chewieController2=ChewieController(
    videoPlayerController: _videoPlayerController1,
     autoInitialize: true,
      fullScreenByDefault: false,
      autoPlay: false,
      aspectRatio: 16/9,
      allowedScreenSleep: false,
);
// await Future.wait([_videoPlayerController.initialize(),_videoPlayerController1.initialize()]);
  }

  void postRegData({
    required String name,
    required String displayName,
    required String email,
    required String gender,
    required String role,
    required String bio,
    required String phone,
    required double lat,
    required double lng,
    required String speciality,
    NetworkImage? image,
  }){
   emit(LoadingPostRegDataState());
    DioHelper.postData(
        path: 'auth/register',
        data: {
          'name':name,
          'display_name':displayName,
          'email':email,
          'phone':phone,
          'gender':gender,
          'role':role,
          'bio':bio,
          'speciality.0':speciality,
          'lat':lat,
          'lng':lng,
        }).then((value) {
      print(value.data);
      emit(SuccessPostRegDataState());
    }).catchError((error){
      print(error.toString());
    emit(ErrorPostRegDataState(error));
    });
  }
}
