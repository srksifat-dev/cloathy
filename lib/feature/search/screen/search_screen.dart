import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode searchFocusNode = FocusNode();
  String filterRadioValue = "men";
  @override
  Widget build(BuildContext context) {
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
                    IconButton(
                        onPressed: () {
                          showBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 100,
                                  color: Colors.amber,
                                  // child: Column(
                                  //   children: [
                                  //     RadioListTile(
                                  //         title: Text("Men"),
                                  //         value: filterRadioValue,
                                  //         groupValue: 1,
                                  //         onChanged: (val) {
                                  //           setState(() {
                                  //             filterRadioValue = val.toString();
                                  //           });
                                  //         }),
                                  //     RadioListTile(
                                  //         title: Text("Women"),
                                  //         value: filterRadioValue,
                                  //         groupValue: 1,
                                  //         onChanged: (val) {
                                  //           setState(() {
                                  //             filterRadioValue = val.toString();
                                  //           });
                                  //         }),
                                  //     RadioListTile(
                                  //         title: Text("Children"),
                                  //         value: filterRadioValue,
                                  //         groupValue: 1,
                                  //         onChanged: (val) {
                                  //           setState(() {
                                  //             filterRadioValue = val.toString();
                                  //           });
                                  //         }),
                                  //   ],
                                  // ),
                                );
                              });
                        },
                        icon: Icon(Icons.filter_alt))
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
