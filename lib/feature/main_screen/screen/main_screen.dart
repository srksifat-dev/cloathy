import 'package:cloathy/feature/cart/screen/cart_screen.dart';
import 'package:cloathy/feature/favorite/screen/favorite_screen.dart';
import 'package:cloathy/feature/home/screen/home_screen.dart';
import 'package:cloathy/feature/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int tabIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (value) {
          setState(() {
            tabIndex = value;
          });
        },
        selectedItemColor: Color(0xfffed97b),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Color(0xff23272c)),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
              backgroundColor: Color(0xff23272c)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "Cart",
              backgroundColor: Color(0xff23272c)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Color(0xff23272c)),
        ],
      ),
      body: pages[tabIndex],
    );
  }
}