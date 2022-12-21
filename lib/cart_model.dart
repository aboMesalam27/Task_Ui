class CartModel {
  CartModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });
  late final int id;
  late final List<Products> products;
  late final int total;
  late final int discountedTotal;
  late final int userId;
  late final int totalProducts;
  late final int totalQuantity;

  CartModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
    total = json['total'];
    discountedTotal = json['discountedTotal'];
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['products'] = products.map((e)=>e.toJson()).toList();
    _data['total'] = total;
    _data['discountedTotal'] = discountedTotal;
    _data['userId'] = userId;
    _data['totalProducts'] = totalProducts;
    _data['totalQuantity'] = totalQuantity;
    return _data;
  }
}

class Products {
  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
  });
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

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['price'] = price;
    _data['quantity'] = quantity;
    _data['total'] = total;
    _data['discountPercentage'] = discountPercentage;
    _data['discountedPrice'] = discountedPrice;
    return _data;
  }
}