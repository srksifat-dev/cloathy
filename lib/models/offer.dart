import 'package:cloathy/models/product.dart';
import 'package:flutter/material.dart';

class Offer {
  final String offerTitle;
  final String subtitle;
  final int? percentage;
  final int? amount;
  final IconData icon;
  final List<Product> products;

  Offer({
    required this.offerTitle,
    required this.subtitle,
    this.percentage,
    this.amount,
    required this.icon,
    required this.products,
  });
}
