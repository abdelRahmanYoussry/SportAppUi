import 'package:adham_tasks/Shared/AppCubit/app_cubit.dart';
import 'package:adham_tasks/Shared/AppCubit/app_cubit.dart';
import 'package:adham_tasks/Shared/AppCubit/app_states.dart';
import 'package:adham_tasks/Shared/AppCubit/components.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController searchController = TextEditingController();
  int ?sportItemId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: myAppBar(
                title: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'الأقسام',
                    style: TextStyle(fontSize: 18.2),
                  ),
                ),
                actionButton: alertActionButton(),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: playerCircleAvatarWidget(
                    imageSize: 15,
                    borderSize: 15,
                    borderColor: Colors.grey,
                    networkImage:
                        'https://scontent-pmo1-1.xx.fbcdn.net/v/t1.6435-1/p240x240/64740059_10217163728877610_4626933787983347712_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=7206a8&_nc_ohc=ep0kKhiFxyYAX8wYV-p&_nc_ht=scontent-pmo1-1.xx&oh=00_AT9gQJeLuhhLRp_C-oH8oMy9z-rbEajtaKPSme7ey8iXIA&oe=62110C16',
                  ),
                )),
            body: Form(
                key: formKey,
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25, top: 11),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 44,
                                  decoration: BoxDecoration(
                                      color: Color(0xffE7EBF8),
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(20),
                                          left: Radius.circular(20))),
                                ),
                                TextFormField(
                                  onTap: () {},
                                  controller: searchController,
                                  keyboardType: TextInputType.name,
                                  textAlign: TextAlign.right,
                                  validator: (value) => value!.length < 1
                                      ? 'Search can\'t  be Empty'
                                      : null,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorMaxLines: 3,
                                    errorStyle: TextStyle(
                                      decorationStyle: TextDecorationStyle.wavy,
                                    ),
                                    suffixIcon: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 0.0),
                                      child: IconButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            print(searchController.text);
                                          }
                                        },
                                        icon: Icon(Icons.search),
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: 'بحث',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(fontSize: 16, height: 1),
                                    prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon:
                                          SvgPicture.asset('assets/Filter.svg'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 100.h,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, right: 5, left: 15, bottom: 10),
                                child: ConditionalBuilder(
                                  fallback: (BuildContext context) => Center(
                                      child: CircularProgressIndicator(color: Colors.deepPurple,)),
                                  condition: AppCubit.get(context).sportsList.length > 0,
                                  builder: (BuildContext context) =>
                                      ListView.separated(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              InkWell(
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
                                                    Text(
                                                      AppCubit.get(context).sportsList[index]['name'],
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    )
                                                  ],
                                                ),
                                                onTap: () {
                                                  print(AppCubit.get(context).sportsList[index]['id']);
                                                  sportItemId=AppCubit.get(context).sportsList[index]['id'];
                                                  print(sportItemId);
                                                 AppCubit.get(context).changeGridviewSportsData(sportItemId: sportItemId);
                                                },
                                              ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                width: 10,
                                              ),
                                          itemCount: AppCubit.get(context).sportsList.length),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 500.h,
                              child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: AppCubit.get(context)
                                      .gridviewSportsList
                                      .length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20),
                                  itemBuilder: (context, index) => Container(
                                        width: 95,
                                        height: 95,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              left: Radius.circular(10),
                                              right: Radius.circular(10),
                                            )),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Image.network(
                                              AppCubit.get(context).gridviewSportsList[index]['icon'],
                                              height: 60.h,
                                              width: 50.w,
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(AppCubit.get(context).gridviewSportsList[index]['name']),
                                            Text(
                                              AppCubit.get(context).gridviewSportsList[index]['user_count'].toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                          ],

                                        ),
                                      )),
                            ),
                          ),
                        ]),
                      )
                    ]))));
      },
    );
  }
}
