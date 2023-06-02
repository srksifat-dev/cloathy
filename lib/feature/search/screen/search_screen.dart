import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode searchFocusNode = FocusNode();
  List<String> filterRadioValues = ["men", "women", "children"];

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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
