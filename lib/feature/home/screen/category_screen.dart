import 'package:cloathy/dummy/dummy_category.dart';
import 'package:cloathy/feature/home/widgets/my_card.dart';
import 'package:cloathy/feature/search/screen/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String selectedCategory = "Man";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = "Man";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: selectedCategory == "Man"
                              ? Border.all()
                              : const Border(),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                            child: Text(
                          "Man",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = "Woman";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: selectedCategory == "Woman"
                              ? Border.all()
                              : const Border(),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                            child: Text(
                          "Woman",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SearchScreen(
                                    query: categories[index].label,
                                  ),),);
                    },
                    child: myCard(
                      icon: categories[index].icon,
                      middle: Text(
                        categories[index].label,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 16,
                ),
                itemCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
