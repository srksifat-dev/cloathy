import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => searchFocusNode.unfocus(),
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
                      focusNode: searchFocusNode,
                      cursorColor: Colors.black,
                      cursorHeight: 30,
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
