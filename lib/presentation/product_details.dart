import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_test_ui_sudi/componts.dart';
import 'package:task_test_ui_sudi/controller/product_controller.dart';
import 'package:task_test_ui_sudi/resoursec/app_style.dart';

import '../resoursec/colors.dart';
import '../widgets/loading_image.dart';

class ProductDetails extends StatefulWidget {
  int productId;
  int currentIndex = 0;

  ProductDetails({
    required this.productId,
  });

  //bool _isLoading = false;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

final cateController = Get.put(ProductController());

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: cateController..getProductDetails(id: widget.productId),
      builder: (coo) => Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            coo.products!.title,
            style: getRegularStyle(color: black, letterSpacing: 0),
          ),
        ),
        backgroundColor: white,
        body: coo.isLoadingProduct.value
            ? customLoading()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: white, boxShadow: [
                        BoxShadow(
                            blurRadius: 15.r,
                            color: const Color.fromRGBO(0, 0, 0, 0.05))
                      ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25.0.h),
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                initialPage: 0,
                                onPageChanged: (index, _) {
                                  setState(() {
                                    widget.currentIndex = index;
                                  });
                                },
                                viewportFraction: 1,
                                aspectRatio: 2,
                                autoPlay: coo.products!.images.length == 1
                                    ? false
                                    : true,
                                autoPlayAnimationDuration:
                                    const Duration(seconds: 2),
                                enlargeCenterPage: true,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.height,
                                autoPlayInterval: const Duration(seconds: 5),
                              ),
                              itemCount: coo.products!.images.length,
                              itemBuilder: (BuildContext context, int index,
                                  int realIndex) {
                                return CachedNetworkImage(
                                  imageUrl: coo.products!.images[index],
                                  height: 100.h,
                                  width: 150.w,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      LoadingImageContainer(
                                    width: 150.w,
                                    height: 100.h,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      LoadingImageContainer(
                                    width: 150.w,
                                    height: 100.h,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 8.0.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: primaryColor,
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      coo.products!.rating.toStringAsFixed(1),
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: coo.products!.images.map(
                                  (i) {
                                    int index = coo.products!.images.indexOf(i);
                                    return Container(
                                      width: 8.0.w,
                                      height: 8.0.h,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 5.0.h, horizontal: 2.0.w),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: widget.currentIndex == index
                                              ? primaryColor
                                              : primaryColor.withOpacity(0.3)),
                                    );
                                  },
                                ).toList(), // this was the part the I had to add
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coo.products!.title,
                            style: getRegularStyle(color: black),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "${coo.products!.price} EGP",
                          ),
                          SizedBox(height: 15.h),
                          Text('Details'),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            '${coo.products!.description}',
                            style: getDescriptionGreyStyle(),
                          ),
                          SizedBox(
                            height: 29.h,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
