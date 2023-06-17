import 'package:cloathy/dummy/dummy_cart.dart';
import 'package:cloathy/dummy/dummy_profile.dart';

import '../models/order.dart';

List<Order> dummyOrders = [
  Order(orderID: "gbsthtr", carts: dummyCarts, receiverName: dummyProfile.name, receiverPhoneNumber: dummyProfile.phoneNumber, receiverEmail: dummyProfile.email, receiverAddress: dummyProfile.address, isPaid: true, deliveryMethod: "COD",totalExpense: 300,orderStatus: "Confirmed",),
  Order(orderID: "gthbtsn", carts: dummyCarts, receiverName: dummyProfile.name, receiverPhoneNumber: dummyProfile.phoneNumber, receiverEmail: dummyProfile.email, receiverAddress: dummyProfile.address, isPaid: false, deliveryMethod: "Courier",totalExpense: 400,orderStatus: "Delivered",),

];
