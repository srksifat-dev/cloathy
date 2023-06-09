import 'package:cloathy/dummy/dummy_offer.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({required this.offerTitle, Key? key}) : super(key: key);
  final String offerTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          offerTitle,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 8, childAspectRatio: 0.8),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            dummy_offers.first.products[index].imageUrl,
                            height: 160,
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
                      ],
                    ),
                    Text(
                      dummy_offers.first.products[index].productName,
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          dummy_offers.first.products[index].price.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.add))
                      ],
                    )
                  ],
                );
              },
              itemCount: dummy_offers.first.products.length,
            ),
          ),
        ],
      ),
    );
  }
}
