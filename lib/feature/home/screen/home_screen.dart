import 'package:cloathy/dummy/dummy_category.dart';
import 'package:cloathy/dummy/dummy_offer.dart';
import 'package:cloathy/dummy/dummy_product.dart';
import 'package:cloathy/feature/home/screen/category_screen.dart';
import 'package:cloathy/feature/home/widgets/category_card.dart';
import 'package:cloathy/feature/home/widgets/my_card.dart';
import 'package:cloathy/feature/home/widgets/product_card.dart';
import 'package:cloathy/feature/search/screen/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../offer/screen/offer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => SearchScreen()));
                      },
                      // Search and filtering section
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                "Search",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                // Category section
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width - 32,
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const CategoryScreen()));
                          },
                          child: categoryCard(
                              label: "All", icon: const Icon(Icons.category))),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => SearchScreen(
                                              query: categories[index].label,
                                            )));
                              },
                              child: categoryCard(
                                  label: categories[index].label,
                                  icon: categories[index].icon),
                            );
                          },
                          separatorBuilder: (_, __) {
                            return const SizedBox(
                              width: 16,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                // Offer section
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => OfferScreen(
                              offerTitle: dummy_offers.first.offerTitle,
                            )));
                  },
                  child: myCard(
                    icon: Icon(
                      dummy_offers.first.icon,
                      size: 40,
                    ),
                    middle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dummy_offers.first.offerTitle,
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          dummy_offers.first.subtitle,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                // New Item Section
                const Text(
                  "New Item",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return productCard(
                          imageUrl: dummyProducts[index].imageUrl,
                          productName: dummyProducts[index].productName,
                          price: dummyProducts[index].price);
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                      width: 16,
                    ),
                    itemCount: 10,
                  ),
                ),

                // Popular Item

                const Text(
                  "Popular Item",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return productCard(
                          imageUrl: dummyProducts[index].imageUrl,
                          productName: dummyProducts[index].productName,
                          price: dummyProducts[index].price);
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                      width: 16,
                    ),
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
