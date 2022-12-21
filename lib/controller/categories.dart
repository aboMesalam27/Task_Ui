import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_test_ui_sudi/presentation/cart_screen.dart';
import 'package:task_test_ui_sudi/presentation/home_page.dart';

import '../presentation/favorites_screen.dart';
import '../models/products_model.dart';
import '../network/local/dio_helper.dart';
import '../presentation/news.dart';
import '../presentation/shop_all.dart';

class CategoriesController extends GetxController {
  var isLoadingCategories = true.obs;
  var isLoadingCategoy = true.obs;
  var allCategories = [];
  ProductsModel? productsModel;
  List<dynamic> getAllCategories() {
    isLoadingCategories(true);
    DioHelper.getData(url: 'products/categories').then((value) {
      allCategories = value.data;
      isLoadingCategories(false);
    });
    return allCategories;
  }

  // void getProductsOfCategory({required String categoryName}) {
  //   print('getProductsOfCategory');
  //   isLoadingCategoy(true);
  //   DioHelper.getData(url: 'products/category/$categoryName').then((value) {
  //     productsModel = ProductsModel.fromJson(value.data);
  //     isLoadingCategoy(false);
  //     update();
  //   });
  //   print(isLoadingCategoy.value);
  // }
  int cIndex = 0;

  void incrementTab(index) {
    cIndex = index;
    update();
  }

  List<Widget> bottomScreens = [

    HomePage(),

    NewsScreen(),

     ShopAllScreen(),
    FavoritesScreen(),
    CartScreen(),
  ];
  void changeBottomNavBar(int index) {
    cIndex = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCategories();
  }
}
