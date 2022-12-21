
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_test_ui_sudi/resoursec/app_style.dart';

import '../resoursec/colors.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 167.w,
      height: 49.h,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.r),
            side: BorderSide(
                color: grey.withOpacity(0.5))),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              Container(
                height: 38.h,
                width: 39.w,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(7.r),
                  color: grey,
                ),
              ),
              SizedBox(
                width: 19.w,
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Office Address',
                    style: getRegularStyle(color: black,fontSize: 11.sp,letterSpacing: 0.5),
                  ),
                  Text('Axis Istanbul, B2 Blok',
                    style: getRegularStyle(color: black,fontSize: 9.sp,letterSpacing: 0.5),),
                  Text('Floor 2, Office 11',
                    style: getRegularStyle(color: black,fontSize: 9.sp,letterSpacing: 0.5),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
