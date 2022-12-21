import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/all_products_by_category.dart';
import '../resoursec/app_style.dart';
import '../resoursec/colors.dart';

class BuildSubCategoryItem extends StatelessWidget {
  BuildSubCategoryItem({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);
  int index;
  var controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductsCategories(
                      cateName: controller.allCategories[index],
                    )));
      },
      child: Column(
        children: [
          SizedBox(
            height: 56.h,
            width: 56.w,
            child: Card(
              color: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: 56.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Text(
                controller.allCategories[index][0].toUpperCase() +
                    " ${controller.allCategories[index]}"
                        .substring(2)
                        .toLowerCase(),
                style: getRegularStyle(
                    color: black, fontSize: 11.sp, letterSpacing: 0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
