import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskapp/modules/start_scraan/start_screen.dart';
import 'package:taskapp/remote/network.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.get();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: ScreenUtilInit(
        designSize: const Size(392.72727272727275, 834.9090909090909),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
            debugShowCheckedModeBanner: false,
            home: const StartScreen(),
          );
        },
      ),
    );
  }
}
// return AnnotatedRegion<SystemUiOverlayStyle>(
// value: const SystemUiOverlayStyle(
// statusBarColor: Colors.transparent,
// ),
// child: MaterialApp(
// builder: (context, widget) => ResponsiveWrapper.builder(
// BouncingScrollWrapper.builder(context, widget!),
// maxWidth: 1200,
// minWidth: 400,
// defaultScale: true,
// breakpoints: const [
// ResponsiveBreakpoint.resize(450, name: MOBILE),
// ResponsiveBreakpoint.autoScale(800, name: TABLET),
// ResponsiveBreakpoint.autoScale(100, name: TABLET),
// ResponsiveBreakpoint.resize(1200, name: DESKTOP),
// ResponsiveBreakpoint.autoScale(2460, name: "4K"),
// ],
// backgroundColor: Colors.white,
// ),
// debugShowCheckedModeBanner: false,
// home: EventBookScreen(),
// ),
// );
