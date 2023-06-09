import 'package:cloathy/dummy/dummy_product.dart';
import 'package:flutter/material.dart';

import '../models/offer.dart';

List<Offer> dummy_offers = [
  Offer(
    offerTitle: "50%",
    subtitle: "on all woman's shoes",
    icon: Icons.percent,
    percentage: 50,
    products: [
      dummyProducts[0],
      dummyProducts[1],
      dummyProducts[2],
      dummyProducts[3],
      dummyProducts[4],
    ],
  ),
  Offer(
    offerTitle: "40%",
    subtitle: "on all woman's shoes",
    icon: Icons.percent,
    percentage: 40,
    products: [
      dummyProducts[0],
      dummyProducts[1],
      dummyProducts[2],
      dummyProducts[3],
      dummyProducts[4],
    ],
  ),
  Offer(
    offerTitle: "30%",
    subtitle: "on all woman's shoes",
    icon: Icons.percent,
    percentage: 30,
    products: [
      dummyProducts[0],
      dummyProducts[1],
      dummyProducts[2],
      dummyProducts[3],
      dummyProducts[4],
    ],
  ),
  Offer(
    offerTitle: "20%",
    subtitle: "on all woman's shoes",
    icon: Icons.percent,
    percentage: 20,
    products: [
      dummyProducts[0],
      dummyProducts[1],
      dummyProducts[2],
      dummyProducts[3],
      dummyProducts[4],
    ],
  ),
];
