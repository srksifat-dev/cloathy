import 'package:flutter/material.dart';

Card myCard({required Widget icon, required Widget middle}) {
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xfff3f3f3)),
            child: Center(
              child: icon,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: middle,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          )
        ],
      ),
    ),
  );
}
