import 'package:cloathy/dummy/dummy_size.dart';
import 'package:cloathy/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.fitWidth,
              )),
          Positioned(
              top: 24,
              left: 8,
              right: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                  ),
                ],
              )),
          Positioned(
            bottom: 0,
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.productName,
                                style: TextStyle(fontSize: 30),
                              ),
                              Text(
                                product.price.toString(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Stylish blue coat, classic, pleasent to the touch natural materials.",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Choose size",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CircleAvatar(
                                    radius: 32,
                                    backgroundColor: Colors.grey[100],
                                    child: Center(
                                      child: Text(
                                        dummy_sizes[index],
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (_, __) => SizedBox(
                                      width: 16,
                                    ),
                                itemCount: dummy_sizes.length),
                          )
                        ],
                      ),
                    ),
                    FilledButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {},
                      label: Text("Add to Cart"),
                      icon: Icon(Icons.add),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
