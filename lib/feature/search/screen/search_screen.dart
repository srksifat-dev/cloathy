import 'package:cloathy/dummy/dummy_product.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key, this.query}) : super(key: key);
  final String? query;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  List<String> filterRadioValues = ["men", "women", "children"];
  List<Product> searchedProducts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.query != null) {
      searchController.text = widget.query!;
      search(widget.query!);
    } else {
      searchedProducts = dummyProducts;
    }
  }

  void search(String query) {
    List<Product> results = [];
    if (query.isEmpty) {
      results = dummyProducts;
    } else {
      results = dummyProducts
          .where((product) =>
              product.productName.toLowerCase().contains(query.toLowerCase()) ||
              product.category.label
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      searchedProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentValue = filterRadioValues[0];
    return GestureDetector(
      onTap: () {
        searchFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff3f3f3),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: searchController,
                      autofocus: true,
                      focusNode: searchFocusNode,
                      cursorColor: Colors.black,
                      // cursorHeight: 30,
                      decoration: InputDecoration(
                        hintText: "Search",
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) => search(value),
                    )),
                    Builder(builder: (context) {
                      return IconButton(
                          onPressed: () {
                            showBottomSheet(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                    builder: (context, setState) {
                                      return Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              "Filter",
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            RadioListTile(
                                                title: const Text("Men"),
                                                value: filterRadioValues[0],
                                                groupValue: currentValue,
                                                onChanged: (val) {
                                                  setState(() {
                                                    currentValue =
                                                        val.toString();
                                                  });
                                                }),
                                            RadioListTile(
                                                title: const Text("Women"),
                                                value: filterRadioValues[1],
                                                groupValue: currentValue,
                                                onChanged: (val) {
                                                  setState(() {
                                                    currentValue =
                                                        val.toString();
                                                  });
                                                }),
                                            RadioListTile(
                                                title: const Text("Children"),
                                                value: filterRadioValues[2],
                                                groupValue: currentValue,
                                                onChanged: (val) {
                                                  setState(() {
                                                    currentValue =
                                                        val.toString();
                                                  });
                                                }),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: TextButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          const MaterialStatePropertyAll(
                                                              Colors.black),
                                                      shape:
                                                          MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            16,
                                                          ),
                                                        ),
                                                      ),
                                                      padding:
                                                          const MaterialStatePropertyAll(
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8))),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Center(
                                                    child: Text(
                                                      "Apply",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        topRight: Radius.circular(32))));
                          },
                          icon: const Icon(Icons.filter_alt));
                    })
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  searchedProducts[index].imageUrl,
                                  height: 160,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.favorite))
                            ],
                          ),
                          Text(
                            searchedProducts[index].productName,
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                searchedProducts[index].price.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add))
                            ],
                          )
                        ],
                      );
                    },
                    itemCount: searchedProducts.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
