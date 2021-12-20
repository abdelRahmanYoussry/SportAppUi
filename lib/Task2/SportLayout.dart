import 'package:adham_tasks/Shared/AppCubit/app_cubit.dart';
import 'package:adham_tasks/Shared/AppCubit/app_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=AppCubit.get(context);
        return Scaffold(
          body:cubit.screenList[cubit.currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              right: 20.0,
                left: 20.0),
            child: Container(
              width: 110,
              height: 65,
              decoration: BoxDecoration(
              color: Colors.red,
              //Colors.transparent,
              backgroundBlendMode: BlendMode.clear,
             borderRadius: BorderRadius.horizontal(
               right: Radius.circular(30),
               left: Radius.circular(30),
             )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(30),
                  left: Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  items: cubit.bottomNavItem,
                  currentIndex: cubit.index,
                  selectedFontSize: 0,
                  onTap: (index){
                  cubit.changeNavBar(index);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
