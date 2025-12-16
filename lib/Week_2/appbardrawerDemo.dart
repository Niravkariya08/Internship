import 'package:flutter/material.dart';
import 'package:internship/DashBoard.dart';
import 'package:internship/Week_1/CardDemo.dart';
import 'package:internship/Week_1/ListViewDemoBuilderListTile.dart';
import 'package:internship/Week_1/signinForm.dart';
import 'package:internship/Week_2/SearchPageDemo.dart';

class Appbardrawerdemo extends StatefulWidget {
  const Appbardrawerdemo({super.key});

  @override
  State<Appbardrawerdemo> createState() => _AppbardrawerdemoState();
}

class _AppbardrawerdemoState extends State<Appbardrawerdemo> {
  int selectedIndex = 1;
  static List<Widget> screen = [
    Searchpagedemo(),
    CardDemo(),
    SignInForm(),
    Listviewdemobuilderlisttile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueAccent,
      //   title: Text(
      //     "Brine Web",
      //     style: TextStyle(color: Colors.white, fontFamily: 'Bold'),
      //   ),
      //   titleSpacing: 12, //leading and title between space
      //   // titleTextStyle: TextStyle(color: Colors.redAccent),
      //   actions: [
      //     IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      //     IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      //   ],
      //   elevation: 4,
      //   shadowColor: Colors.blueAccent,
      //   actionsIconTheme: IconThemeData(
      //     color: Colors.white,
      //     // applyTextScaling: true,
      //     // opticalSize: 10,
      //     size: 24,
      //     // weight: 40,
      //   ),
      //   centerTitle: true,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      //   ),
      //   // excludeHeaderSemantics: false,
      //   // notificationPredicate: (notification) {},
      //   // toolbarHeight: 50,
      //   forceMaterialTransparency: false,

      //   // bottom: ,
      // ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(60)),
        ),
        backgroundColor: Colors.orange[80],
        semanticLabel: 'This is App Drawer.',
        child: ListView(
          children: [
            // Drawer
            Container(
              height: 120,
              child: Column(
                children: [
                  DrawerHeader(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/logo.jpg"),
                        maxRadius: 30,
                        // minRadius: 24,
                      ),
                      // horizontalTitleGap: 4,
                      title: Text(
                        "App Drawer",
                        style: TextStyle(fontFamily: 'Semibold'),
                      ),
                      subtitle: Text(
                        "brineweb@gmail.com",
                        style: TextStyle(fontFamily: 'Regular'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(leading: Icon(Icons.star), title: Text("Starred")),
            ListTile(
              leading: Icon(Icons.watch_later_outlined),
              title: Text("Recent"),
            ),
            ListTile(
              leading: Icon(Icons.offline_pin_rounded),
              title: Text("Ofline"),
            ),
            ListTile(leading: Icon(Icons.upload), title: Text("Upload")),
          ],
        ),
      ),
      body: screen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        elevation: 12,
        // enableFeedback: true,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        // mouseCursor: SystemMouseCursors.click,
        // selectedIconTheme: ,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.cyan,
            icon: Icon(Icons.person),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
