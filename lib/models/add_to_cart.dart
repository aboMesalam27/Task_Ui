class AddToCartModel {

  late final int id;
  late final List<Products> products;
  late final int total;
  late final int discountedTotal;
  late final int userId;
  late final int totalProducts;
  late final int totalQuantity;

  AddToCartModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
    total = json['total'];
    discountedTotal = json['discountedTotal'];
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }


}

class Products {

  late final int id;
  late final String title;
  late final int price;
  late final int quantity;
  late final int total;
  late final double discountPercentage;
  late final int discountedPrice;

  Products.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    discountPercentage = json['discountPercentage'];
    discountedPrice = json['discountedPrice'];
  }


}