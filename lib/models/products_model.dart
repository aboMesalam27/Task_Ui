class ProductsModel {
  late final List<Products> products;
  late final int total;
  late final int skip;
  late final int limit;

  ProductsModel.fromJson(Map json) {
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}

class Products {
  late final int id;
  late final String title;
  late final String description;
  late final int price;
  late final num discountPercentage;
  late final num rating;
  late final int stock;
  late final String brand;
  late final String category;
  late final String thumbnail;
  late final List<String> images;

  Products.fromJson(Map json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = List.castFrom<dynamic, String>(json['images']);
  }
}
