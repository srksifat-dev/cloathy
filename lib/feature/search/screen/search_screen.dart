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
        backgroundColor: Color(0xfff3f3f3),
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
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
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
                                            Text(
                                              "Filter",
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            RadioListTile(
                                                title: Text("Men"),
                                                value: filterRadioValues[0],
                                                groupValue: currentValue,
                                                onChanged: (val) {
                                                  setState(() {
                                                    currentValue =
                                                        val.toString();
                                                  });
                                                }),
                                            RadioListTile(
                                                title: Text("Women"),
                                                value: filterRadioValues[1],
                                                groupValue: currentValue,
                                                onChanged: (val) {
                                                  setState(() {
                                                    currentValue =
                                                        val.toString();
                                                  });
                                                }),
                                            RadioListTile(
                                                title: Text("Children"),
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
                                                          MaterialStatePropertyAll(
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
                                                          MaterialStatePropertyAll(
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8))),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Center(
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
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        topRight: Radius.circular(32))));
                          },
                          icon: Icon(Icons.filter_alt));
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
