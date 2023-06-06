import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SizedBox productCard({
  required String imageUrl,
  required String productName,
  required int price,
}) {
  return SizedBox(
    width: 130,
    child: Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageUrl,
                height: 200,
              ),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border))
          ],
        ),
        Text(
          productName,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              price.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add))
          ],
        )
      ],
    ),
  );
}
