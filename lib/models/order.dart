import 'package:cloathy/models/address.dart';

import 'cart.dart';

class Order {
  final String orderID;
  final List<Cart> carts;
  final String receiverName;
  final String receiverPhoneNumber;
  final String receiverEmail;
  final Address receiverAddress;
  final bool isPaid;
  final String deliveryMethod;
  final int totalExpense;
  final String orderStatus;
  Order({
    required this.orderID,
    required this.carts,
    required this.receiverName,
    required this.receiverPhoneNumber,
    required this.receiverEmail,
    required this.receiverAddress,
    required this.isPaid,
    required this.deliveryMethod,
    required this.totalExpense,
    required this.orderStatus,
  });
}
