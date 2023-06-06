import 'package:cloathy/models/category.dart';

class Product {
  final String productID;
  final String productName;
  final int price;
  final String imageUrl;
  final Category category;

  Product({
    required this.productID,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}
