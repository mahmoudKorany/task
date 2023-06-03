import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:taskapp/cubit/appStates.dart';

import '../models/event_book_models.dart';
import '../remote/network.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavBarState());
  }

  final List<ItemModel> itemsModel = [
    ItemModel(text: 'Spots', icon: Icons.sports_basketball, color: 'F0635A'),
    ItemModel(text: 'Music', icon: Iconsax.music, color: 'F59762'),
    ItemModel(text: 'Food', icon: Icons.restaurant_menu, color: '29D697'),
    ItemModel(text: 'Art', icon: Icons.art_track, color: '46CDFB'),
  ];

  Widget item({required int index}) {
    return Container(
      height: 39.h,
      width: 107.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: HexColor(itemsModel[index].color),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              itemsModel[index].icon,
              color: HexColor('FFFFFF'),
              size: 25.sp,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              itemsModel[index].text,
              style: TextStyle(
                fontSize: 15.sp,
                color: HexColor('FFFFFF'),
                fontFamily: 'jannah',
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<ItemModel2> itemModels2 = [
    ItemModel2(
      location: '36 Guild Street London, UK ',
      title: 'International Band Music Party',
      image1:
          'https://mobirise.com/bootstrap-template//profile-template/assets/images/timothy-paul-smith-256424-1200x800.jpg',
      image2:
          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
      image3:
          'https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&w=600',
      image4: 'assets/images/image 84.png',
    ),
    ItemModel2(
      location: 'Radius Gallery • Santa Cruz, CA',
      title: 'Jo Malone London’s Mohammed salah pop',
      image1:
          'https://mobirise.com/bootstrap-template//profile-template/assets/images/timothy-paul-smith-256424-1200x800.jpg',
      image2:
          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
      image3:
          'https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&w=600',
      image4: 'assets/images/image 87.png',
    ),
    ItemModel2(
      location: '36 Guild Street London, UK ',
      title: 'International Band Music Party',
      image1:
          'https://mobirise.com/bootstrap-template//profile-template/assets/images/timothy-paul-smith-256424-1200x800.jpg',
      image2:
          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
      image3:
          'https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&w=600',
      image4: 'assets/images/image 84.png',
    ),
    ItemModel2(
      location: 'Radius Gallery • Santa Cruz, CA',
      title: 'Jo Malone London’s Mohammed salah pop',
      image1:
          'https://mobirise.com/bootstrap-template//profile-template/assets/images/timothy-paul-smith-256424-1200x800.jpg',
      image2:
          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
      image3:
          'https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&w=600',
      image4: 'assets/images/image 87.png',
    ),
  ];

  Widget item2({required int index}) {
    return SizedBox(
      width: 237.w,
      height: 265.h,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Image.asset(
                      itemModels2[index].image4,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 45.w,
                          height: 47.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: HexColor('FFFFFF').withOpacity(.6),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '10',
                                style: TextStyle(
                                  color: HexColor('F0635A'),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                              ),
                              Text(
                                'June',
                                style: TextStyle(
                                  color: HexColor('F0635A'),
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 30,
                          height: 30,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: HexColor('FFFFFF').withOpacity(.6),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Icon(
                            Icons.bookmark,
                            color: HexColor('EB5757'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                itemModels2[index].title,
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 16.r,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 7.r,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 17,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                itemModels2[index].image1,
                              ),
                              radius: 15.r,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 17.r,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                itemModels2[index].image2,
                              ),
                              radius: 15.r,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.0),
                            radius: 12.r,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 17.r,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                itemModels2[index].image3,
                              ),
                              radius: 15.r,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0),
                            radius: 16.r,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0),
                            radius: 7.r,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      '+ 20 Going',
                      style: TextStyle(
                        color: HexColor('3F38DD'),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
                  SizedBox(
                    width: 185.w,
                    child: Text(
                      itemModels2[index].location,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item3({required int index}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            Container(
              width: double.infinity.w,
              height: 40.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.0.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: const NetworkImage(
                        'https://mobirise.com/bootstrap-template//profile-template/assets/images/timothy-paul-smith-256424-1200x800.jpg'),
                    radius: 20.r,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '${getName(uid: postsModel?[index]['userId'])}',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.infinity.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: HexColor('39D1F2').withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
                child: Text(
                  '${postsModel?[index]['title']}',
                  maxLines: 2,
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.infinity.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: HexColor('FF8D5D').withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
                child: Text(
                  '${postsModel?[index]['body']}',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<dynamic>? postsModel;

  void getPostsData() {
    emit(GetPostsDataLoading());
    DioHelper.getData(url: 'posts').then((value) {
      postsModel = value.data;
      emit(GetPostsDataSuccess());
    }).catchError((error) {
      emit(GetPostsDataError(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  List<dynamic>? profileData;
  void getProfileData() {
    emit(GetProfileDataLoading());
    DioHelper.getData(url: 'users').then((value) {
      profileData = value.data;
      emit(GetProfileDataSuccess());
    }).catchError((error) {
      emit(GetProfileDataError(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  String? getName({required int uid}) {
    String? name;
    for (int x = 0; x < profileData!.length; x++) {
      if (profileData?[x]['id'] == uid) {
        name = profileData?[x]['name'];
      }
    }
    return name;
  }
}
