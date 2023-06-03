import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:taskapp/cubit/appCubit.dart';
import 'package:taskapp/cubit/appStates.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getProfileData()
        ..getPostsData(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) => {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: HexColor('4A43EC'),
                title: Text(
                  'Posts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                  ),
                ),
                elevation: 0.0,
              ),
              backgroundColor: Colors.white,
              body: ConditionalBuilder(
                condition: AppCubit.get(context).postsModel != null &&
                    AppCubit.get(context).profileData != null,
                fallback: (context) => Center(
                    child: CircularProgressIndicator(
                  color: HexColor('4A43EC'),
                )),
                builder: (context) => ListView.separated(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      AppCubit.get(context).item3(index: index),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20.h,
                  ),
                  itemCount: AppCubit.get(context).postsModel!.length,
                ),
              ),
            );
          }),
    );
  }
}
