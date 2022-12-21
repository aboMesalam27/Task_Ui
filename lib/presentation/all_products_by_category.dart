import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_test_ui_sudi/componts.dart';
import 'package:task_test_ui_sudi/controller/cart_controller.dart';
import 'package:task_test_ui_sudi/controller/cateNameController.dart';
import 'package:task_test_ui_sudi/favorite_cahe.dart';
import 'package:task_test_ui_sudi/presentation/product_details.dart';
import 'package:task_test_ui_sudi/resoursec/app_style.dart';

import '../resoursec/colors.dart';
import '../widgets/loading_image.dart';

class ProductsCategories extends StatefulWidget {
  String cateName;
  ProductsCategories({required this.cateName});
  @override
  State<ProductsCategories> createState() => _ProductsCategoriesState();
}

class _ProductsCategoriesState extends State<ProductsCategories> {
  bool isSelectedFav = false;
  final cateController = Get.put(CategoriesNameController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesNameController>(
      init: cateController
        ..getProductsOfCategory(categoryName: widget.cateName),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: white,
            elevation: 0,
            title: Text(
              widget.cateName,
              style: getRegularStyle(color: black),
            ),
          ),
          backgroundColor: white,
          body: cateController.isLoading.value
              ? customLoading()
              : GridView.count(
                  childAspectRatio: 1 / 1.4,
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: List.generate(
                      controller.productsModel!.products.length, (index) {
                    return Column(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>ProductDetails(
                                  productId:controller.productsModel!.products[index].id,
                                )
                              ));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              elevation: 3,
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.r),
                                      child: CachedNetworkImage(
                                        imageUrl: controller.productsModel!
                                            .products[index].thumbnail,
                                        placeholder: (context, url) =>
                                            LoadingImageContainer(
                                          width: double.infinity.w,
                                          height: 130.h,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            LoadingImageContainer(
                                          width: double.infinity.w,
                                          height: 130.h,
                                        ),
                                        height: double.infinity.h,
                                        width: double.infinity.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GetBuilder<FavCahe>(
                                                builder: (control) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0.w,
                                                    vertical: 8.0.h),
                                                child: CircleAvatar(
                                                  backgroundColor: white,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        addOrRemoveFav(control,
                                                            controller, index);
                                                        control.update();
                                                      },
                                                      icon: Center(
                                                        child: Icon(
                                                          control.isFavourite(
                                                                  controller
                                                                      .productsModel!
                                                                      .products[
                                                                          index]
                                                                      .id
                                                                      .toString())
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_border_rounded,
                                                          color: control.isFavourite(
                                                                  controller
                                                                      .productsModel!
                                                                      .products[
                                                                          index]
                                                                      .id
                                                                      .toString())
                                                              ? Colors.blue
                                                              : grey,
                                                        ),
                                                      )),
                                                ),
                                              );
                                            })
                                          ],
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            controller.productsModel!.products[index].title
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style:
                                getRegularStyle(color: black, letterSpacing: 0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '${controller.productsModel!.products[index].price.toStringAsFixed(1)} EGP',
                          style: getBoldStyle(color: black, letterSpacing: 0),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Card(
                                color: white,
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              Text('12'),
                              Card(
                                color: white,
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
                )),
    );
  }

  void addOrRemoveFav(
      FavCahe control, CategoriesNameController controller, int index) {
    if (!control
        .isFavourite(controller.productsModel!.products[index].id.toString())) {
      control.addToFavorite(
          controller.productsModel!.products[index].id.toString());
    } else {
      control.removeFavorite(
          controller.productsModel!.products[index].id.toString());
    }
  }
}
