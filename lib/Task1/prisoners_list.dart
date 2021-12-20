import 'dart:ui';
import 'package:adham_tasks/Shared/AppCubit/app_cubit.dart';
import 'package:adham_tasks/Shared/AppCubit/app_states.dart';
import 'package:adham_tasks/Task1/prisoner_inner.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PrisonersList extends StatelessWidget {
  const PrisonersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       BlocConsumer<AppCubit,AppStates>(
        listener: (context ,state){},
        builder: (context ,state){
        List finalPrisonersList=AppCubit.get(context).prisonersList;
          return  Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              leading: IconButton(onPressed: (){
                Navigator.pop(context);
              },
                  icon:Icon(Icons.arrow_back_ios_outlined)),
              title: Text('Prisoners List',
                style: TextStyle(fontSize: 24,
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body:  ConditionalBuilder(
              condition: finalPrisonersList.length>0 ,
              builder: (BuildContext context) => ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: finalPrisonersList.length,
                itemBuilder: (context,index)=>buildPrisonersListItem(context, finalPrisonersList[index]),)
          , fallback: (BuildContext context) => Center(child: CircularProgressIndicator(),)
            )
          );
        },
      );

  }

  Widget buildPrisonersListItem(BuildContext context,finalPrisonersList)=>InkWell(
    onTap: (){ Navigator.push(context,
        MaterialPageRoute(builder: (context)=> PrisonerInnerScreen()));
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20,
          bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        height: 200,
        width: double.infinity,
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
                      Text('${finalPrisonersList['name'] !=null ? finalPrisonersList['name']:'No Name'}',
                        style:TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold
                        ) ,),
                      SizedBox(
                        height: 10,
                      ),
                      Text('${finalPrisonersList['place'] !=null ? finalPrisonersList['place']:'No place'}',
                        style:TextStyle(fontSize: 20,
                            color: Colors.grey)
                        ,),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 26  ,
                    backgroundImage: NetworkImage(
                        '${finalPrisonersList['thumbnail'] }'
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
                Text('${finalPrisonersList['neededAmount'] }',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                Spacer(),
                Text('${finalPrisonersList['status'] }',
                  style: Theme.of(context).textTheme.subtitle2!
                      .copyWith(color: Colors.indigo)
                  ,),
              ],),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration:BoxDecoration(
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: Text('Debt Money raised for ${finalPrisonersList['name'] !=null ? finalPrisonersList['name']:'No Name'}, Will be released Shortly',
                  style: Theme.of(context).textTheme.caption!
                      .copyWith(color: Colors.grey,fontSize: 15),
                  // overflow:TextOverflow.ellipsis ,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),

      ),
    ),
  );
}
