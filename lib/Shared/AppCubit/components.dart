
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

Widget chatWidget({
  required BuildContext context,
  String titleName='sender name',
  String  senderNetworkImage='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX0PmQXykxAG26tlT1YXWhLG5H0KldoAbm7A&usqp=CAU',
  String  senderWorkTitle='اعلامى',
  String  senderMessage='meassanadsadkasmfdasfasfjasifjasifjasifjsai',

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
              Text(titleName,style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontSize: 14,color: Color(0xff5E5D8F)
              ),),
              SizedBox(
                width: 5,
              ),

            ],
          ),
          Container(
            width: 205,
            child: Column(
              children: [
                Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(senderWorkTitle,style: Theme.of(context).textTheme.caption,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.mic),
                    ),

                  ],
                ),


                Text(
                    senderMessage,
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
            image: NetworkImage(senderNetworkImage),
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
  double imageSize=20,
  double borderSize=22,
})=>Stack(
  children: [
    CircleAvatar(
      backgroundColor: borderColor,
      radius: borderSize,
      child:  CircleAvatar(
        backgroundImage:NetworkImage(
            networkImage!
        ),
        radius: imageSize,
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
  double imageSize=20,
  double borderSize=22,
  double firstSizedBoxHeight=10,
  double playerNameSized=13,
  double playerPositionSized=10,
})=>Column(
  children: [
    SizedBox(
      height: firstSizedBoxHeight,
    ),
    playerCircleAvatarWidget(
        borderSize: borderSize,
        imageSize: imageSize,
        borderColor: borderColor,
        networkImage: networkImage),
    SizedBox(
      height: 5,
    ),
    Text(playerName!,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: playerNameSized
      ),
    ),
    Text(playerPosition!,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: playerPositionSized, color: Colors.grey,height: 1.1
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

Widget videoWidget({required ChewieController chewieController}){
  return Container(
    width: 180,
    height: 110,
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(25),
          right: Radius.circular(25),
        )
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(20),
        right: Radius.circular(20),
      ),
      child: Chewie(
        controller: chewieController,

      ),
    ),
  );

}

AppBar myAppBar({
  Widget? actionButton,
  Widget ?title,
  bool centerTitle=true,
PreferredSize? preferredSize,
 Widget?leading
})=> AppBar(
bottom: preferredSize,
  automaticallyImplyLeading: false,
  backgroundColor: Colors.grey[100],
  elevation: 0.0,
  leading:leading ,
  centerTitle: centerTitle,
  title:title,
  actions: [
    actionButton!
  ],
);

Widget alertActionButton()=> Padding(
  padding: const EdgeInsets.only(right: 25.0),
  child: IconButton(
    onPressed: () {},
    icon: Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        SvgPicture.asset(
          'assets/Alert.svg',
          height: 32,
          width: 32,
        ),
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
);

Widget plusActionButton()=> Padding(
  padding: const EdgeInsets.only(
      right: 10),
  child:  CircleAvatar(
      backgroundColor: Colors.deepPurple,
      radius: 15,
      child:  IconButton(
          color: Colors.white,
          iconSize: 15,
          onPressed: (){},
          icon: Icon(Icons.add))),
);