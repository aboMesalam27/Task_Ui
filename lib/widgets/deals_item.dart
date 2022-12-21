import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resoursec/app_style.dart';

import '../resoursec/colors.dart';
class DealsItem extends StatelessWidget {
  const DealsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              height: 90.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius:
                  BorderRadius.circular(12.r)),
            ),
            Positioned(
              right: 72.w,
              bottom: 72.h,
              child: Container(
                width: 24.w,
                height: 24.h,
                decoration: ShapeDecoration(
                    color: white,
                    shape: CircleBorder(
                        side: BorderSide(
                            width: 1.5.w,
                            color: white))),
                child: const Icon(
                  Icons.favorite_border_rounded,
                  size: 13,
                  color: grey,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: 15.w,
        ),
        Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text('Summer Sun Ice Cream Pack',
                style: getRegularStyle(color: black,fontSize: 11.sp,letterSpacing: 0),),
            SizedBox(
              height: 5.h,
            ),
            Text('Pieces 5',
              style: getRegularStyle(color: black,fontSize: 11.sp,letterSpacing: 0),),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                // ignore: prefer_const_constructors
                Icon(
                  Icons.add_location_alt_outlined,
                  size: 12,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text('15  Minutes Away',
                  style: getRegularStyle(color: black,fontSize: 10.sp,letterSpacing: 0),)
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [
                Text('\$12',
                  style: getBoldStyle(color: red,fontSize: 11.sp,letterSpacing: 0),),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  '\$12',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.grey,
                    decoration:
                    TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}