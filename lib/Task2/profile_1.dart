import 'package:adham_tasks/Shared/AppCubit/app_cubit.dart';
import 'package:adham_tasks/Shared/AppCubit/app_states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SportProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {},
  builder: (context, state) {
    List <String>pictureList=[
      'https://mybayutcdn.bayut.com/mybayut/wp-content/uploads/Cover-47-420x230.jpg',
      'https://watanimg.elwatannews.com/old_news_images/large/7816_660_660_istockphoto_1622661-cartoon-goalkeeper-blue1.jpg',
      'https://mybayutcdn.bayut.com/mybayut/wp-content/uploads/Kids-football-team_Huddle-1.jpg'];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      //Color(0xffF9FAFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
         centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text('الرئيسية',
          style:TextStyle(fontSize: 18.2) ,),
      ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(onPressed: (){}, icon: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                SvgPicture.asset('assets/Alert.svg',
                  height: 32, width: 32,),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                )
              ],
            ),
      ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25,top: 11),
                    child: Container(
                     width: double.infinity,
                     height: 44,
                     decoration: BoxDecoration(
                       color: Color(0xffE7EBF8),
                       borderRadius: BorderRadius.horizontal(
                         right:Radius.circular(20) ,left: Radius.circular(20)
                       )
                       ),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){},
                            icon: SvgPicture.asset('assets/Filter.svg'),),
                          Spacer(),
                          Text('بحث',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize:16
                            ),),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: IconButton(onPressed: (){},
                                icon: Icon(Icons.search)),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15,right: 5,
                        left: 5,bottom: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          child: Column(
                            children: [
                              //How To make The Icon clickable
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: SvgPicture.asset('assets/AmricanFootball.svg',
                                width: 65,),
                            ),
                            Text('FootBall')
                          ],),
                          onTap: (){},
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              //How To make The Icon clickable
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: SvgPicture.asset('assets/BaseBall.svg',
                                  width: 70,clipBehavior:Clip.antiAlias ,),
                              ),
                              Text('BaseBall')
                            ],),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              //How To make The Icon clickable
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: SvgPicture.asset('assets/ArabicFootball.svg',
                                  width: 70,),
                              ),
                              Text('كرة القدم')
                            ],),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              //How To make The Icon clickable
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: SvgPicture.asset('assets/BasketBall.svg',
                                  width: 70,),
                              ),
                              Text('كرة السلة')
                            ],),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              //How To make The Icon clickable
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: SvgPicture.asset('assets/Tennis.svg',
                                  width: 70,),
                              ),
                              Text('التنس')
                            ],),
                        ),
                      ],
                    ),
                  ),
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
                                  // SizedBox(width:
                                  // 5 ,),
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
                              initialPage: 1,
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
                             Container(
                               width: 180,
                               height: 110,
                               decoration: BoxDecoration(
                                   color: Colors.red,
                                   image: DecorationImage(
                                       image: NetworkImage(
                                         'https://www.premierskillsacademy.com/images/videos/gazza-video.jpg',
                                       ),
                                       fit: BoxFit.cover
                                   ),
                                   borderRadius: BorderRadius.horizontal(
                                     left: Radius.circular(20),
                                     right: Radius.circular(20),
                                   )
                               ),
                             ),
                             SizedBox(
                               width: 25,
                             ),
                             Container(
                               width: 180,
                               height: 110,
                               decoration: BoxDecoration(
                                   color: Colors.red,
                                   image: DecorationImage(
                                       image: NetworkImage(
                                         'https://i.ytimg.com/vi/18IgvBGO-bY/maxresdefault.jpg',
                                       ),
                                       fit: BoxFit.cover
                                   ),
                                   borderRadius: BorderRadius.horizontal(
                                     left: Radius.circular(20),
                                     right: Radius.circular(20),
                                   )
                               ),
                             ),
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

    );
  },
);
  }
}

Widget newsWidget({
  required BuildContext context,
  String titleName='نادى الزمالك',
  String  titleNetworkImage='https://upload.wikimedia.org/wikipedia/en/0/04/ZamalekSC.png',
  String  newsNetworkImage='https://www.kingfut.com/wp-content/uploads/2021/03/Zamalek.jpg',

})=> Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Padding(
      padding: const EdgeInsets.only(
        right: 8.0,),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(titleName,style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 16
              ),),
              SizedBox(
                width: 5,
              ),
              Image.network(
                 titleNetworkImage,
                height: 20,
                width: 20,
              ),
            ],
          ),
          Container(
            width: 205,
            child: Column(
              children: [
                Text(
                  'كارتيرون يجتمع باللاعبين قبل انطلاق مران الزمالك ',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      height: 1
                  ),
                ),
                Text(
                    ' عقد الفرنسي باتريس كارتيرون المدير الفني للفريق الأول لكرة القدم بنادي الزمالك جلسة مع لاعبي الفريق قبل انطلاق مران اليوم الأربعاء',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.caption!.copyWith(height: 1)
                ),
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      width: 120,
      height: 60,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(newsNetworkImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(20),
            left: Radius.circular(20),
          )
      ),
    ),

  ],
);

Widget playerCircleAvatarWidget({
  String ?networkImage,
  Color ?borderColor,
})=>Stack(
  children: [
    CircleAvatar(
      backgroundColor: borderColor,
      radius: 25,
      child:  CircleAvatar(
        backgroundImage:NetworkImage(
            networkImage!
        ),
        radius: 20,
      ),

    ),


  ],
);

Widget myDivider({double height=2})=> Container(
  width: double.infinity,
  color: Colors.grey,
  height: height,

);

Widget playerColumn({
  required BuildContext context,
 String ?playerName,
 String ?playerPosition,
  String ?networkImage,
  Color ?borderColor=Colors.grey,
})=>Column(
  children: [
    SizedBox(
      height: 10,
    ),
    playerCircleAvatarWidget(borderColor: borderColor,
        networkImage: networkImage),
    SizedBox(
      height: 5,
    ),
    Text(playerName!,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 13
      ),
    ),
    Text(playerPosition!,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 10,color: Colors.grey,height: 1.1
      ),
    ),
    SizedBox(
      height: 2,
    ),
  ],
);

Widget coachCircleAvatarWidget({
  String ?networkImage,
  Color ?borderColor,
})=>Stack(
  children: [
    CircleAvatar(
      backgroundColor: borderColor,
      radius: 25,
      child:  CircleAvatar(
        backgroundImage:NetworkImage(
            networkImage!
        ),
        radius: 20,
      ),

    ),


  ],
);



Widget coachColumn({
  required BuildContext context,
  String ?coachName,
  String ?coachPosition,
  String ?networkImage,
  Color ?borderColor=Colors.grey,
})=>Column(
  children: [
    SizedBox(
      height: 10,
    ),
    coachCircleAvatarWidget(borderColor: borderColor,
        networkImage: networkImage),
    SizedBox(
      height: 5,
    ),
    Text(coachName!,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 13
      ),
    ),
    Text(coachPosition!,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 10,color: Colors.grey,height: 1.1
      ),
    ),
    SizedBox(
      height: 2,
    ),
  ],
);