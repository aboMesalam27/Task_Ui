import 'package:get/get.dart';

import '../models/products_model.dart';
import '../network/local/dio_helper.dart';

class CategoriesNameController extends GetxController {
  final isLoading = true.obs;

  ProductsModel? productsModel;

  void getProductsOfCategory({required String categoryName}) {
    print('getProductsOfCategory');
    isLoading(true);
    update();
    DioHelper.getData(url: 'products/category/$categoryName').then((value) {
      productsModel = ProductsModel.fromJson(value.data);
      isLoading(false);
      update();
      print(value.data);
    });
  }


}
