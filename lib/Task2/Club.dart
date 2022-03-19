import 'package:adham_tasks/Shared/AppCubit/components.dart';
import 'package:adham_tasks/Task2/tabBarPages/Data.dart';
import 'package:adham_tasks/Task2/tabBarPages/chats.dart';
import 'package:adham_tasks/Task2/tabBarPages/posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClubScreen extends StatelessWidget {
   ClubScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
         extendBody: false,
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(210.h),
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.grey[100],
             flexibleSpace: Padding(
               padding: const EdgeInsets.only(top: 50),
               child: playerColumn(context: context,
                   networkImage:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX0PmQXykxAG26tlT1YXWhLG5H0KldoAbm7A&usqp=CAU',
                   borderColor: Colors.grey,
                   playerPosition: 'مهاجم'  ,
                   playerName: 'أوباما',
                   borderSize: 37.r,
                   imageSize: 35.r,
                   firstSizedBoxHeight: 0,
                   playerNameSized: 14,
                   playerPositionSized: 12
               ),
             ),
            titleSpacing: 20,
          leading: IconButton(
               icon: Icon(Icons.more_vert),
              onPressed: (){},
                    ),
            actions: [plusActionButton(),],
            bottom: PreferredSize(
              preferredSize: Size.zero,
              child: Container(
                margin:EdgeInsets.only(
                  left: 25,right: 25,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(20),
                    left: Radius.circular(20)
                  )
                ),
                child: TabBar(
                  labelPadding:EdgeInsets.only(bottom: 2) ,
                  indicator: BoxDecoration(
                    color: Color(0xff5E5D8f),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(20)
                        ,right: Radius.circular(20)),
                  ),
                  unselectedLabelColor:Color(0xff5E5D8f),
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                  tabs: [
                    Tab(child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text('محادثات' ,),
                    ),),
                    Tab(child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text('منشورات'),
                    ),),
                    Tab(child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text('بيانات'),
                    ),),
                  ],
                ),
              ),
            )
          ),
        ),
       body: TabBarView(
         children: [
           ChatsScreen(),
           PostsScreen(),
           DataScreen(),
         ],
       ),
      ),
    );
  }
}
