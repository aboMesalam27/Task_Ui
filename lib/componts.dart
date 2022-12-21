import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'resoursec/colors.dart';

void showToast({required String message, required ToastStatus status}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(status),
        textColor: white,
        fontSize: 16.sp);

//
enum ToastStatus { success, error, waring }

Color? chooseToastColor(ToastStatus status) {
  Color? color;
  switch (status) {
    case ToastStatus.success:
      color = Colors.green;
      break;
    case ToastStatus.waring:
      color = Colors.deepOrangeAccent;
      break;
    case ToastStatus.error:
      color = Colors.green;
      break;
    case ToastStatus.waring:
      color = Colors.deepOrangeAccent;
      break;
    case ToastStatus.error:
      color = Colors.red;
      break;
  }
  return color;
}

britNess() {
  return SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarIconBrightness: Brightness.dark,
      //systemNavigationBarColor: kSurfaceColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white, // Note RED here
    ),
  );
}

Widget customLoading() {
  return const Center(
    child:
        CircularProgressIndicator(color: Colors.orangeAccent, strokeWidth: 2),
  );
}
