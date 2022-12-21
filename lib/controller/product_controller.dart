import 'package:get/get.dart';

import '../models/products_model.dart';
import '../network/local/dio_helper.dart';

class ProductController extends GetxController {

  final isLoadingProduct = true.obs;

  Products? products;


  void getProductDetails({required int id}) {
    isLoadingProduct(true);
    DioHelper.getData(url: 'https://dummyjson.com/products/$id').then((value) {
      products = Products.fromJson(value.data);
      isLoadingProduct(false);
      update();
    });
  }
}
