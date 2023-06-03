import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:taskapp/cubit/appCubit.dart';
import 'package:taskapp/cubit/appStates.dart';

class EventBookScreen extends StatelessWidget {
  EventBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getPostsData()
        ..getProfileData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) => {},
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    height: (179 + 20).h,
                    width: double.infinity.w,
                    color: HexColor('FFFFFF'),
                  ),
                  Container(
                    width: double.infinity.w,
                    height: 179.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: HexColor('4A43EC'),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 30.h,
                      bottom: 50.h,
                      start: 30.w,
                      end: 30.w,
                    ),
                    child: SizedBox(
                      height: 150.h,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60.h,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.menu,
                                    size: 35.sp,
                                    color: HexColor('FFFFFF'),
                                  ),
                                ),
                                SizedBox(
                                  width: (50 - 1.65).w,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Current Location',
                                          style: TextStyle(
                                            fontFamily: 'jannah',
                                            fontSize: 15.sp,
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey[200],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'New Yourk,USA',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'jannah',
                                          color: HexColor('FFFFFF')),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: (50 - 1.65).w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    radius: 15.r,
                                    backgroundColor: HexColor('524CE0'),
                                    child: Icon(
                                      Iconsax.notification1,
                                      color: HexColor('FFFFFF'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Iconsax.search_normal,
                                      color: HexColor('FFFFFF'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 156.w,
                                    height: 60.h,
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '| Search',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Container(
                                    width: 80.w,
                                    height: 40.h,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: HexColor('524CE0'),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: HexColor('A29EF0'),
                                          radius: 13.r,
                                          child: Icon(
                                            Icons.filter_list,
                                            size: 20.sp,
                                            color: HexColor('5D56F3'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        const Text(
                                          'Filters',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 159.h,
                    ),
                    child: SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            AppCubit.get(context).item(index: index),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                        itemCount: AppCubit.get(context).itemsModel.length,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Upcoming Events',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'See All',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                    size: 20.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 270.h,
                        child: ListView.separated(
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              AppCubit.get(context).item2(index: index),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10.w,
                          ),
                          itemCount: AppCubit.get(context).itemModels2.length,
                        ),
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20.0.w,
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: double.infinity,
                            height: 127.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: HexColor('d6feff'),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 15.w, top: 15.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Invite You Friends',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        'Get \$20 for ticket',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 72.w,
                                        height: 32.h,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: HexColor('00F8FF'),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'INVITE',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Image.asset(
                                    'assets/images/77mLIhf8TW 1.png',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Nearby You',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'See All',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                    size: 20.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20.0.w,
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: double.infinity.w,
                            height: 120.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: HexColor('ffffff'),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 15.w, end: 15.w),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        child: Image.asset(
                                            'assets/images/image 80.png')),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1st  May- Sat -2:00 PM',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: HexColor('5669ff'),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        SizedBox(
                                          width: 200.w,
                                          child: Text(
                                            'Women\'s leadership conference',
                                            maxLines: 2,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 17.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Iconsax.location,
                                              color: Colors.grey,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              '36 Guild Street London, UK',
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15.sp,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: HexColor('5669ff'),
            onPressed: () {},
            child: const Icon(
              Icons.add_box_rounded,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            leftCornerRadius: 10.r,
            rightCornerRadius: 10.r,
            backgroundColor: Colors.white,
            elevation: 10,
            iconSize: 25.sp,
            blurEffect: true,
            inactiveColor: Colors.grey,
            activeColor: HexColor('5669ff'),
            height: 60.h,
            icons: const [
              Icons.explore,
              Icons.event_note_outlined,
              Iconsax.location,
              Icons.person,
            ],
            activeIndex: AppCubit.get(context).currentIndex,
            gapLocation: GapLocation.center,
            onTap: (int index) {
              AppCubit.get(context).changeBottomNavBar(index);
            },
          ),
        ),
      ),
    );
  }
}
