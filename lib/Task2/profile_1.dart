import 'package:adham_tasks/Shared/AppCubit/app_cubit.dart';
import 'package:adham_tasks/Shared/AppCubit/app_states.dart';
import 'package:adham_tasks/Shared/AppCubit/components.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SportProfileScreen extends StatelessWidget {
  GlobalKey<FormState> formKey=GlobalKey();
  TextEditingController searchController=TextEditingController();
  List <String>pictureList=[
    'https://mybayutcdn.bayut.com/mybayut/wp-content/uploads/Cover-47-420x230.jpg',
    'https://watanimg.elwatannews.com/old_news_images/large/7816_660_660_istockphoto_1622661-cartoon-goalkeeper-blue1.jpg',
    'https://mybayutcdn.bayut.com/mybayut/wp-content/uploads/Kids-football-team_Huddle-1.jpg'];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      //Color(0xffF9FAFF),
      appBar: myAppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text('الرئيسية',
            style:TextStyle(fontSize: 18.2) ,),
        ),
        actionButton: alertActionButton(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    //Search
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0,right: 25,top: 11),
                      child:
                      Stack(
                        children: [
                          Container(
                           width: double.infinity,
                           height: 44,
                           decoration: BoxDecoration(
                             color: Color(0xffE7EBF8),
                             borderRadius: BorderRadius.horizontal(
                               right:Radius.circular(20) ,left: Radius.circular(20)
                             )
                             ),
                          ),
                          TextFormField(
                            onTap: (){},
                            controller: searchController,
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.right,
                            validator: (value)=>value!.length<1?'Search can\'t  be Empty':null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              errorMaxLines: 3,
                              errorStyle: TextStyle(
                                decorationStyle: TextDecorationStyle.wavy,

                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: IconButton(onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    print(searchController.text);
                                  }
                                },
                                  icon: Icon(Icons.search),color: Colors.black,),
                              ),
                              hintText: 'بحث',
                              hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                                  fontSize: 16,height: 1
                              ),
                              prefixIcon:IconButton(
                                onPressed: (){},
                                icon: SvgPicture.asset('assets/Filter.svg'),),
                            ),

                          )
                        ],
                      ),
                    ),
                    //Sports List
                    SizedBox(
                      height: 100.h,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15,right: 5,
                            left: 15,bottom: 0),
                        child:ConditionalBuilder(
                          fallback: (BuildContext context) =>Center(child: CircularProgressIndicator()),
                          condition: AppCubit.get(context).sportsList.length>0,
                          builder: (BuildContext context) =>ListView.separated(
                            physics: BouncingScrollPhysics(),
                             scrollDirection:Axis.horizontal ,
                              shrinkWrap: true,
                              itemBuilder:(context,index)=>  InkWell(
                                child: Column(
                                  children: [
                                    //How To make The Icon clickable
                                    Container(
                                      width: 55.w,
                                      height: 50.h,
                                      child: Image(
                                        image: NetworkImage(AppCubit.get(context).sportsList[index]['icon']),

                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(AppCubit.get(context).sportsList[index]['name'],
                                      textAlign:TextAlign.left ,style: TextStyle(fontSize: 12),)
                                  ],),
                                onTap: (){
                                  // print(AppCubit.get(context).sportsList[0]['name']);
                                },
                              ),
                              separatorBuilder: (context,index)=>SizedBox(
                                width: 10,
                              ),
                              itemCount: AppCubit.get(context).sportsList.length),)
                        // Row(
                        //   mainAxisSize: MainAxisSize.max,
                        //   children: [
                        //     InkWell(
                        //       child: Column(
                        //         children: [
                        //           //How To make The Icon clickable
                        //         Padding(
                        //           padding: const EdgeInsets.only(bottom: 10.0),
                        //           child:Container(
                        //             width: 50,
                        //             height: 65,
                        //             child: Image(
                        //               image: NetworkImage(AppCubit.get(context).sportsList[0]['icon']),
                        //
                        //             ),
                        //           )
                        //           // SvgPicture.asset('assets/AmricanFootball.svg',
                        //           //   width: 65,),
                        //         ),
                        //         Text('Football')
                        //       ],),
                        //       onTap: (){
                        //       // print(AppCubit.get(context).sportsList[0]['name']);
                        //       },
                        //     ),
                        //     SizedBox(
                        //       width: 20,
                        //     ),
                        //     InkWell(
                        //       onTap: (){},
                        //       child: Column(
                        //         children: [
                        //           //How To make The Icon clickable
                        //           Padding(
                        //             padding: const EdgeInsets.only(bottom: 10.0),
                        //             child: SvgPicture.asset('assets/BaseBall.svg',
                        //               width: 70,clipBehavior:Clip.antiAlias ,),
                        //           ),
                        //           Text('BaseBall')
                        //         ],),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     InkWell(
                        //       onTap: (){},
                        //       child: Column(
                        //         children: [
                        //           //How To make The Icon clickable
                        //           Padding(
                        //             padding: const EdgeInsets.only(bottom: 10.0),
                        //             child: SvgPicture.asset('assets/ArabicFootball.svg',
                        //               width: 70,),
                        //           ),
                        //           Text('كرة القدم')
                        //         ],),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     InkWell(
                        //       onTap: (){},
                        //       child: Column(
                        //         children: [
                        //           //How To make The Icon clickable
                        //           Padding(
                        //             padding: const EdgeInsets.only(bottom: 10.0),
                        //             child: SvgPicture.asset('assets/BasketBall.svg',
                        //               width: 70,),
                        //           ),
                        //           Text('كرة السلة')
                        //         ],),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     InkWell(
                        //       onTap: (){},
                        //       child: Column(
                        //         children: [
                        //           //How To make The Icon clickable
                        //           Padding(
                        //             padding: const EdgeInsets.only(bottom: 10.0),
                        //             child: SvgPicture.asset('assets/Tennis.svg',
                        //               width: 70,),
                        //           ),
                        //           Text('التنس')
                        //         ],),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ),
                    //Carousel Slider
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.deepPurple,
                                boxShadow:[BoxShadow(
                                    color: Colors.grey.shade500,
                                    offset: Offset(0,32),
                                    blurRadius:40,
                                    spreadRadius: 1
                                )]
                            ),
                          child: CarouselSlider(
                              items: pictureList.map((e) =>  Container(
                                height: 120,
                                width: 420,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 130,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(
                                            height: 20,),
                                          Text('سجل الان',
                                            style: TextStyle(color: Colors.amber,
                                                fontSize: 22,height: 0.5
                                            ),),
                                          Text('أكاديمية الوفاق',
                                            style: TextStyle(color: Colors.black,
                                                fontSize: 18
                                            ),),
                                          SizedBox(
                                            height: 20,),
                                          Container(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  child: Container(
                                                    height: 40,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        color: Colors.deepPurple[300],
                                                        borderRadius: BorderRadius.horizontal(
                                                          right: Radius.circular(20),
                                                          left: Radius.circular(20),
                                                        )
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'سجل الان',style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                      ),
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: (){},
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 0.0),
                                      child: Container(
                                        width: 260,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(45),
                                              right: Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  '$e'
                                                ),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ) ).toList(),
                              options: CarouselOptions(
                                 height: 150,
                                reverse: true,
                                initialPage: 0,
                                autoPlay: false,
                                enableInfiniteScroll: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration: Duration(seconds: 1),
                                autoPlayCurve: Curves.bounceOut,
                                scrollDirection: Axis.horizontal,
                                viewportFraction: 1,
                                onPageChanged: (int indicatorIndex,CarouselPageChangedReason  reason)=>AppCubit.get(context).changeIndicator(indicatorIndex)

                              ),
                          ),
                        ),
                       SizedBox(
                         height: 20,
                       ),
                       AnimatedSmoothIndicator(
                           activeIndex: AppCubit.get(context).index,
                         count: pictureList.length,
                         effect: JumpingDotEffect(
                           activeDotColor:Colors.purple,
                           dotWidth: 10,
                           dotHeight: 10
                         ),
                       )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //Videos
                    Container(
                       width: double.infinity,
                       decoration: BoxDecoration(
                         color: Color(0xffE3E7F1)
                       ),
                       child: Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Text('عن التطبيق'),
                               SizedBox(
                                 width: 35,
                                 height:15 ,
                               ),
                             ],
                           ),
                           SizedBox(
                             height: 15,
                           ),
                           Row(
                             children: [
                               SizedBox(
                                 width: 15,
                               ),
                              videoWidget(chewieController: AppCubit.get(context).chewieController1),
                               SizedBox(
                                 width: 25,
                               ),
                               videoWidget(chewieController: AppCubit.get(context).chewieController2),
                             ],
                           ),
                           SizedBox(
                             height: 30,
                           ),
                         ],
                       ),
                     ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 17,
                          horizontal: 25.0),
                      child: Container(
                        width: 500,
                        height: 260,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20),
                              left: Radius.circular(20),
                            ),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,vertical: 12),
                          child: Column(
                            children: [
                              newsWidget(context: context),
                             myDivider(),
                              SizedBox(
                                height: 10,
                              ),
                              newsWidget(context: context),
                              SizedBox(
                                height: 12,
                              ),
                              InkWell(
                                child: Container(
                                  width: double.infinity,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xffA5B0CC),
                                    borderRadius: BorderRadiusDirectional.horizontal(
                                      start: Radius.circular(20),
                                      end: Radius.circular(20),
                                    )
                                  ),
                                  child: Center(child: Text('المزيد من الأخبار',
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.white
                                  ),)),
                                ),
                                onTap: (){},
                              )
                            ],
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0
                      ),
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(20),
                            left: Radius.circular(20),
                          ),
                        ) ,
                        child: Row(
                          children: [
                            Container(
                              width: 110,
                              height: 210,
                              decoration: BoxDecoration(
                                  color: Color(0xffE3E7F1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),

                                )
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset('assets/players.png',width: 100,),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height: 30,
                                      width: 75,
                                      decoration: BoxDecoration(
                                          color: Color(0xffA5B0CC),
                                          borderRadius: BorderRadius.horizontal(
                                            right: Radius.circular(20),
                                            left: Radius.circular(20),
                                          )
                                      ),
                                      child: Center(
                                        child: Text(
                                          'المزيد',style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                      ),
                                    ),
                                    onTap: (){},
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 210,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  playerColumn(context: context,
                                  networkImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcueEP19DIL9JL3vSjgpFGYrQfsAnyMUMbyw&usqp=CAU',
                                    borderColor: Colors.grey[300],
                                    playerName: 'محمود شيكابالا',
                                    playerPosition: 'مهاجم'
                                  ),
                                   myDivider(
                                     height: 1
                                   ),
                                  playerColumn(context: context,
                                  playerName: 'أحمد زيزو',
                                   playerPosition: 'جناج أيمن',
                                    networkImage: 'https://img.kooora.com/?i=omar_a%2Fkooora%2F2021%2F6%2F2021-06-25_164524.jpg',
                                    borderColor: Colors.grey[300]

                                  )

                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                              Container(
                                color: Colors.grey,
                                width: 1,
                                height: 210,
                              )
                              ],
                            ),
                            Container(
                              width: 120,
                              height: 210,
                              decoration: BoxDecoration(
                               color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )

                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  playerColumn(context: context,
                                  networkImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcueEP19DIL9JL3vSjgpFGYrQfsAnyMUMbyw&usqp=CAU',
                                    borderColor: Colors.grey[300],
                                    playerName: 'محمود شيكابالا',
                                    playerPosition: 'مهاجم'
                                  ),
                                   myDivider(
                                     height: 1
                                   ),
                                  playerColumn(context: context,
                                  playerName: 'أحمد زيزو',
                                   playerPosition: 'جناج أيمن',
                                    networkImage: 'https://img.kooora.com/?i=omar_a%2Fkooora%2F2021%2F6%2F2021-06-25_164524.jpg',
                                    borderColor: Colors.grey[300]

                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0
                      ),
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(20),
                            left: Radius.circular(20),
                          ),
                        ) ,
                        child: Row(
                          children: [
                            Container(
                              width: 110,
                              height: 210,
                              decoration: BoxDecoration(
                                  color: Color(0xffE3E7F1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),

                                  )
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset('assets/Coach.png',
                                    width: 100,),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    child: Container(
                                      height: 30,
                                      width: 75,
                                      decoration: BoxDecoration(
                                          color: Color(0xffA5B0CC),
                                          borderRadius: BorderRadius.horizontal(
                                            right: Radius.circular(20),
                                            left: Radius.circular(20),
                                          )
                                      ),
                                      child: Center(
                                        child: Text(
                                          'المزيد',style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                      ),
                                    ),
                                    onTap: (){},
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 210,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  coachColumn(context: context,
                                      networkImage: 'https://img.kooora.com/?i=epa%2Fsoccer%2F2021-11%2F2021-11-22%2F2021-11-22-09598047_epa.jpg',
                                      borderColor: Colors.grey[300],
                                      coachName: 'كارتيرون',
                                      coachPosition: 'مدرب الزمالك'
                                  ),
                                  myDivider(
                                      height: 1
                                  ),
                                  coachColumn(context: context,
                                      coachName: 'يورجن كلوب',
                                      coachPosition: 'مدرب ليفربول',
                                      networkImage: 'https://cdn.al-ain.com/images/2020/4/28/122-000522-klopp-chooses-favorite-star-in-liverpool_700x400.jpg',
                                      borderColor: Colors.grey[300]
                                  )

                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  color: Colors.grey,
                                  width: 1,
                                  height: 210,
                                )
                              ],
                            ),
                            Container(
                              width: 120,
                              height: 210,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  coachColumn(context: context,
                                      networkImage: 'https://img.kooora.com/?i=epa%2Fsoccer%2F2021-11%2F2021-11-22%2F2021-11-22-09598047_epa.jpg',
                                      borderColor: Colors.grey[300],
                                      coachName: 'كارتيرون',
                                      coachPosition: 'مدرب الزمالك'
                                  ),
                                  myDivider(
                                      height: 1
                                  ),
                                  coachColumn(context: context,
                                      coachName: 'يورجن كلوب',
                                      coachPosition: 'مدرب ليفربول',
                                      networkImage: 'https://cdn.al-ain.com/images/2020/4/28/122-000522-klopp-chooses-favorite-star-in-liverpool_700x400.jpg',
                                      borderColor: Colors.grey[300]

                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  },
);
  }
}
