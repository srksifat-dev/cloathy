import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget categoryCard({required String label, required Widget icon}) {
  return Column(
    children: [
      Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Center(
          child: SizedBox(height: 40, width: 40, child: Center(child: icon)),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(label)
    ],
  );
}
