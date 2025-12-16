import 'package:flutter/material.dart';

class GridviewDemo extends StatefulWidget {
  const GridviewDemo({super.key});

  @override
  State<GridviewDemo> createState() => _GridviewDemoState();
}

class _GridviewDemoState extends State<GridviewDemo> {
  final List<Map<String, dynamic>> cards = [
    {'color': Colors.orange, 'Title': 'Home', 'icons': Icons.home},
    {'color': Colors.green, 'Title': 'Menu', 'icons': Icons.menu},
    {'color': Colors.blue, 'Title': 'Settings', 'icons': Icons.settings},
    {'color': Colors.purple, 'Title': 'User', 'icons': Icons.person},
    {'color': Colors.black, 'Title': 'Edit', 'icons': Icons.edit},
    {'color': Colors.indigo, 'Title': 'Delete', 'icons': Icons.delete},
    {'color': Colors.red, 'Title': 'Clock', 'icons': Icons.lock_clock},
    {
      'color': Colors.lightBlueAccent,
      'Title': 'Download',
      'icons': Icons.download_done,
    },
    {'color': Colors.yellow, 'Title': 'Battery', 'icons': Icons.battery_3_bar},
    {'color': Colors.cyan, 'Title': 'Back Up', 'icons': Icons.backup},
    {'color': Colors.orange, 'Title': 'Home', 'icons': Icons.home},
    {'color': Colors.green, 'Title': 'Menu', 'icons': Icons.menu},
    {'color': Colors.blue, 'Title': 'Settings', 'icons': Icons.settings},
    {'color': Colors.purple, 'Title': 'User', 'icons': Icons.person},
    {'color': Colors.black, 'Title': 'Edit', 'icons': Icons.edit},
    {'color': Colors.indigo, 'Title': 'Delete', 'icons': Icons.delete},
    {'color': Colors.red, 'Title': 'Clock', 'icons': Icons.lock_clock},
    {
      'color': Colors.lightBlueAccent,
      'Title': 'Download',
      'icons': Icons.download_done,
    },
    {'color': Colors.yellow, 'Title': 'Battery', 'icons': Icons.battery_3_bar},
    {'color': Colors.cyan, 'Title': 'Back Up', 'icons': Icons.backup},
    {'color': Colors.orange, 'Title': 'Home', 'icons': Icons.home},
    {'color': Colors.green, 'Title': 'Menu', 'icons': Icons.menu},
    {'color': Colors.blue, 'Title': 'Settings', 'icons': Icons.settings},
    {'color': Colors.purple, 'Title': 'User', 'icons': Icons.person},
    {'color': Colors.black, 'Title': 'Edit', 'icons': Icons.edit},
    {'color': Colors.indigo, 'Title': 'Delete', 'icons': Icons.delete},
    {'color': Colors.red, 'Title': 'Clock', 'icons': Icons.lock_clock},
    {
      'color': Colors.lightBlueAccent,
      'Title': 'Download',
      'icons': Icons.download_done,
    },
    {'color': Colors.yellow, 'Title': 'Battery', 'icons': Icons.battery_3_bar},
    {'color': Colors.cyan, 'Title': 'Back Up', 'icons': Icons.backup},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid View Demo")),
      body: Container(
        child: GridView.builder(
          // physics: BouncingScrollPhysics(),
          // shrinkWrap: true,
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            // mainAxisExtent: 100,
            childAspectRatio: 1,
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            final cards_items = cards[index];
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("No Data Found"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Card(
                elevation: 8,
                color: cards_items['color'],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(cards_items['icons'], color: Colors.white),
                    Text(
                      cards_items['Title'],
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
