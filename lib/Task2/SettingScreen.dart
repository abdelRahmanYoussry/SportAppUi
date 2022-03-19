import 'package:adham_tasks/Shared/AppCubit/app_cubit.dart';
import 'package:adham_tasks/Shared/AppCubit/app_states.dart';
import 'package:adham_tasks/Shared/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
 List<int> searchList=[1,2,3,4,5,6,7];
 int s=0;
 int e=7;
  int? m;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('test'),
          ),
          IconButton(
            onPressed: () {
              for(int i=0;searchList[i]!=6;i++){
                m=s+(e-s)~/2;
                if(searchList[m!]==6){
                 return print(searchList[m!].toString()+'   '+(i+1).toString());

                }else if(6<searchList[m!]){
                  e=m!;
                } else if(6> searchList[m!]){
                  s=m!;
                }
              }

              },icon: Icon(Icons.question_answer)),
             // linear search
             //  for(int i=0;i<searchList.length;i++){
             //   // print(searchList[4]);
             //    if(searchList[i]==12)
             //       print(searchList[i].toString()+'  '+(i+1).toString());
             //  }
              // AppCubit.get(context).postRegData(
              //     name: 'Mahmoud Kassem',
              //     displayName: 'abdo',
              //     email: 'abdoabdo8384@gmail.com',
              //     gender: 'male',
              //     role: 'client',
              //     bio: ':I love coffee',
              //     phone: '+201026333941',
              //     lat: 31.20215,
              //     lng: 29.5456,
              //     speciality: 'coffe',
              //     );




        ],
      ),
    );
  },
);
  }
}
