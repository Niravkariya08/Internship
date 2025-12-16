import 'package:flutter/material.dart';
import 'package:internship/Week_1/CardDemo.dart';
import 'package:internship/Week_1/ListViewDemoBuilderListTile.dart';
import 'package:internship/Week_1/signinForm.dart';
import 'package:internship/Week_2/SearchPageDemo.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  static List<Widget> screen = [
    Searchpagedemo(),
    CardDemo(),
    SignInForm(),
    Listviewdemobuilderlisttile(),
  ];
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: screen[currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItems(Icons.search, 'Search', 0),
              NavItems(Icons.home, 'Home', 1),
              NavItems(Icons.person, 'Account', 2),
              NavItems(Icons.settings, 'Settings', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget NavItems(IconData icon, String label, int index) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: isSelected ? 28 : 22,
            color: isSelected ? Colors.white : Colors.black,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: isSelected ? 14 : 12,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
