import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_test_ui_sudi/controller/cart_controller.dart';
import 'package:task_test_ui_sudi/favorite_cahe.dart';
import 'package:task_test_ui_sudi/presentation/home_layout.dart';
import 'package:task_test_ui_sudi/presentation/home_page.dart';

import 'debug/app_bloc_observer.dart';
import 'network/local/dio_helper.dart';

// late SharedPreferences prefs;
void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => FavCahe.init());

  DioHelper.init();

  // prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 790),
      builder: (c, i) => GetMaterialApp(
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0.sp),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeLayout(),
      ),
    );
  }
}
