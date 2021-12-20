import 'package:adham_tasks/Shared/AppCubit/app_cubit.dart';
import 'package:adham_tasks/Shared/AppCubit/app_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'inner_prisoner_model.dart';

class PrisonerInnerScreen extends StatelessWidget {
  const PrisonerInnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          // var finalInnerPrisonersList=AppCubit.get(context).model!;
          return Scaffold(
             extendBodyBehindAppBar: true,
              extendBody: true,
              backgroundColor: Colors.grey[300],
              appBar: AppBar(
              leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back_ios_outlined),color: Colors.white,),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                    icon: Icon(Icons.share),
                    onPressed: (){},
                    color: Colors.white,
                  ),
                )
              ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          ),
              body: ConditionalBuilder(
                  condition:  AppCubit.get(context).model!=null,
                  builder: (BuildContext context) => buildInnerItems(context, (AppCubit.get(context).model!.model)!)
                  , fallback: (BuildContext context) => Center(child: CircularProgressIndicator(),)
              ) ,
          );

        },

      );


  }
  Widget buildInnerItems(BuildContext context,Model model){
    return Container(
      child: Column(
        children: [
          Container(
            height: 520,
            child: Stack(
             alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  child: Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                     image: DecorationImage(
                       fit: BoxFit.cover,
                       image: NetworkImage(model.image)
                     )
                    ),
                  ),
                  alignment: AlignmentDirectional.topCenter,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                         blurRadius: 10,
                        offset: Offset(0,15)
                      )
                    ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  height: 140,
                  width: 335,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20,
                      top: 22,),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${model.name !=null ? model.name : 'no Name'}',
                                  style:TextStyle(
                                      fontSize: 20,fontWeight: FontWeight.bold
                                  ) ,),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${model.place !=null ? model.place:'No place'}',
                                  style:TextStyle(fontSize: 20,
                                      color: Colors.grey)
                                  ,),
                              ],
                            ),
                            Spacer(),
                            CircleAvatar(
                              radius: 26  ,
                              backgroundImage: NetworkImage(
                                  '${model.thumbnail }'
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 8,
                          decoration:BoxDecoration(
                              color: Colors.deepPurple.shade800,
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Text('${model.neededAmount }',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                          Spacer(),
                          Text('${model.status }',
                            style: Theme.of(context).textTheme.subtitle2!
                                .copyWith(color: Colors.indigo)
                            ,),
                        ],),


                      ],
                    ),
                  ),

                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text('Case Details',
                style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ) ,)
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 240,
            width: 400,

            child: Scrollbar(
              child: SingleChildScrollView(

                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,
                          horizontal: 5.0),
                      child: Text(model.details.toString()),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
