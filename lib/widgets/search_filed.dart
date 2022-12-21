import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_test_ui_sudi/resoursec/app_style.dart';

import '../resoursec/colors.dart';
class SearchFiled extends StatelessWidget {
   SearchFiled({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Container(
        width: 315,
        decoration: BoxDecoration(
          color: greyLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: 'Search in thousands of products',
            hintStyle: getRegularStyle(color: grey,letterSpacing: 0,fontSize: 14.sp),
            prefixIcon: Icon(
              Icons.search,
              color: black.withOpacity(0.7),
            ),
            contentPadding: const EdgeInsets.all(12),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
              const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: Colors.black12, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
              const BorderSide(color: Color(0xffE64646)),
            ),
            disabledBorder: InputBorder.none,
          ),
          controller: searchController,
        ),
      ),
    );
  }
}
