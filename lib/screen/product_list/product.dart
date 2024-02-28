import 'package:crud_operations/api/api.dart';

class ProductList {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  ProductList({
    this.id = 0,
    this.title = "",
    this.description = "",
    this.price = 0.0,
    this.discountPercentage = 0.0,
    this.rating = 0.0,
    this.stock = 0,
    this.brand = "",
    this.category = "",
    this.thumbnail = "",
    this.images = const <String>[],
  });

  factory ProductList.fromJson(Map<String, dynamic> json) {
    return ProductList(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      discountPercentage: (json['discountPercentage'] ?? 0.0).toDouble(),
      rating: (json['rating'] ?? 0.0).toDouble(),
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? '',
      category: json['category'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      images: List<String>.from(json['images'] ?? []),
    );
  }

  static fromJsonToList(dynamic list) {
    return (list ?? [])
        .map<ProductList>((json) => ProductList.fromJson(json))
        .toList();
  }

  static Future<List<ProductList>> getProductList() async {
    List<ProductList> list = [];
    dynamic res = await Api.request(Api.productList, isGet: true);

    try {
      list = ProductList.fromJsonToList(res['products']);

    } catch (_) {}
    return list;
  }

  static Future<List<ProductList>> getProductListCategoryWise() async {
    List<ProductList> list = [];
    dynamic res = await Api.request(Api.productCategoryType, isGet: true);

    try {
      list = ProductList.fromJsonToList(res['products']);

    } catch (_) {}
    return list;
  }


}
