import 'package:get/get.dart';
import 'package:task_test_ui_sudi/cart_model.dart';
import 'package:task_test_ui_sudi/models/add_to_cart.dart';

import '../network/local/dio_helper.dart';

class CartController extends GetxController implements GetxService {
  var isLoadingCart = true.obs;
  AddToCartModel? addToCartModel;
  CartModel ?cartModel;
  void addToCart({required int id, required int quantity}) {
    isLoadingCart(true);
    DioHelper.postData(url: 'carts/add', data: {
      "userId": 1,
       "products": [
        {
          "id": id,
          "quantity": quantity,
        }
      ]
    }).then((value) {
      addToCartModel = AddToCartModel.fromJson(value.data);
      print(value.data);
      isLoadingCart(false);
    });
  }
  
  Future getCart({required int cartId}){
   return DioHelper.getData(url: 'https://dummyjson.com/carts/$cartId').then((value) {
      cartModel=CartModel.fromJson(value.data);
      print(cartModel!.products);
    });
  }
  
}
