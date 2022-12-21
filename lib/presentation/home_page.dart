import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_test_ui_sudi/resoursec/app_style.dart';

import 'package:task_test_ui_sudi/controller/categories.dart';
import 'package:task_test_ui_sudi/resoursec/app_text.dart';
import 'package:task_test_ui_sudi/widgets/category_item.dart';
import 'package:task_test_ui_sudi/widgets/deals_item.dart';
import 'package:task_test_ui_sudi/widgets/offer_slide.dart';
import 'package:task_test_ui_sudi/widgets/search_filed.dart';

import '../componts.dart';
import '../widgets/sub_category_item.dart';
import 'cart_screen.dart';

import '../resoursec/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cateController = Get.put(CategoriesController());
  @override
  Widget build(BuildContext context) {
    britNess();
    return GetBuilder<CategoriesController>(
        init: CategoriesController()..getAllCategories(),
        builder: (controller) => Scaffold(
              backgroundColor: white,
              body: Obx(() {
                if (cateController.isLoadingCategories.value) {
                  return customLoading();
                } else {
                  return ListView(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 34.h,
                              width: 123.w,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50.r),
                                  bottomLeft: Radius.circular(30.r),
                                  bottomRight: Radius.circular(10.r),
                                  topLeft: Radius.circular(30.r),
                                )),
                                color: redAccent,
                                child: Row(
                                  children: [
                                    const Icon(Icons.add_location,
                                        color: white),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      AppText.mustafa,
                                      style: getRegularStyle(
                                          color: white, letterSpacing: 0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 34.w,
                              height: 34.h,
                              decoration: ShapeDecoration(
                                  color: white,
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          width: 1.5.w, color: grey))),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SearchFiled(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const AddressItem(),
                            ),
                            SizedBox(
                              width: 13.w,
                            ),
                            const AddressItem(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppText.explorByCa,
                              style: getBoldStyle(
                                  color: black,
                                  fontSize: 11.sp,
                                  letterSpacing: 0),
                            ),
                            Text(
                              AppText.seeAll,
                              style: getRegularStyle(
                                color: black,
                                fontSize: 9.sp,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        height: 85.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return BuildSubCategoryItem(
                              index: index,
                              controller: cateController,
                            );
                          },
                          itemCount: controller.allCategories.length,
                          separatorBuilder: (context, index) => SizedBox(
                            width: 5.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppText.dealsOfDay,
                              style: getBoldStyle(
                                  color: black,
                                  fontSize: 11.sp,
                                  letterSpacing: 0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: SizedBox(
                          height: 120.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => SizedBox(
                              width: 40.w,
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return const DealsItem();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const OfferSlide(),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  );
                }
              }),
            ));
  }
}
