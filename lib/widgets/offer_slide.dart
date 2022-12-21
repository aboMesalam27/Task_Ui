import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resoursec/app_style.dart';
import '../resoursec/colors.dart';
class OfferSlide extends StatelessWidget {
  const OfferSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Container(
        height: 131.h,
        width: 346.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.pinkAccent.shade100,
        ),
        child: Row(
          children: [
            Expanded(child: Container()),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h,),
                  Text('Mega',
                    style: getBoldStyle(color: red,fontSize: 11.sp,letterSpacing: 0)),
                  RichText(
                    text: TextSpan(
                      text: 'WHOPP ',
                        style: getBoldStyle(color: Colors.purple.shade500,fontSize: 19.sp,letterSpacing: 0),
                      children: [

                        TextSpan(
                            text: 'E',
                          style: getBoldStyle(color: red,fontSize: 19.sp,letterSpacing: 0),
                        ),

                        TextSpan(
                            text: ' R',
                          style: getBoldStyle(color: Colors.purple.shade500,fontSize: 19.sp,letterSpacing: 0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Text('\$17',
                        style: getBoldStyle(color: red,fontSize: 19.sp,letterSpacing: 0),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        '\$ 12',
                          style: getBoldStyle(color: white,fontSize: 19.sp,letterSpacing: 0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    '* Available until 24 December 2020',
                    style: getRegularStyle(color: white,fontSize: 11.sp,letterSpacing: 0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
