import 'package:adham_tasks/Shared/AppCubit/app_states.dart';
import 'package:adham_tasks/Task1/inner_prisoner_model.dart';
import 'package:adham_tasks/Task2/Club.dart';
import 'package:adham_tasks/Task2/SettingScreen.dart';
import 'package:adham_tasks/Task2/categories.dart';
import 'package:adham_tasks/Task2/profile_1.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dio_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  List<dynamic> prisonersList=[];


  void getPrisonersData(){
    emit(LoadingGetPrisonersDataState());
    DioHelper.getData(path: '/v1/cases?caseStatus=2').then((value) {
      emit(SuccessGetPrisonersDataState());
      prisonersList=value.data['model'];
      //print(prisonersList[0]['name']);
    })
        .catchError((error){
         // print(error.toString());
      emit(ErrorGetPrisonersDataState(error.toString()));

    });

  }
  late Map<String,dynamic>  innerPrisonersList;
  InnerModel? model;

  void getInnerPrisonersData(){
    emit(LoadingGetInnerPrisonersDataState());
    DioHelper.getData(path: 'v1/cases/55').then((value) {
      emit(SuccessGetInnerPrisonersDataState());
     model=InnerModel.fromJson(value.data);
     //print(model!.model!.place.toString());
    })
        .catchError((error){
         // print(error.toString());
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
    BottomNavigationBarItem(icon: Icon(Icons.settings,size: 30,),label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.people,size: 30,),label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.person,size: 30,),label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label: ''),



  ];


}