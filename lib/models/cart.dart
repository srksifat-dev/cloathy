import 'package:cloathy/models/product.dart';

class Cart {
  final Product product;
  final int quantity;
  final String size;

  Cart({required this.product,required this.quantity,required this.size});
}
