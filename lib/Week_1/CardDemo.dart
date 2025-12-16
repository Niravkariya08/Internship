import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({super.key});

  @override
  State<CardDemo> createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Card Demo"),
      //   backgroundColor: Colors.indigo,
      //   foregroundColor: Colors.white,
      // ),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Brine Web",
          style: TextStyle(color: Colors.white, fontFamily: 'Bold'),
        ),
        titleSpacing: 12, //leading and title between space
        // titleTextStyle: TextStyle(color: Colors.redAccent),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                barrierLabel: 'Hello From Brine Web',
                enableDrag: true,
                showDragHandle: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(50),
                ),
                elevation: 12,
                barrierColor: Colors.black87,
                backgroundColor: Colors.grey[100],
                context: context,
                builder: (context) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Terms and Conditions constitute",
                          style: TextStyle(fontFamily: 'Bold', fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "These Terms and Conditions constitute a legally binding agreement made between you, whether personally or on behalf of an entity Nirav and Brine Web we, concerning your access to and use of the [website name.com] website as well as any other media form, media channel, mobile website or mobile application related, linked, or otherwise connected thereto.You agree that by accessing the Site, you have read, understood, and agree to be bound by all of these Terms and Conditions. If you do not agree with all of these Terms and Conditions, then you are expressly prohibited from using the Site and you must discontinue use immediately.",
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Done"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.shield_outlined),
          ),
          PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              PopupMenuItem(value: 'Home', child: Text("Home")),
               PopupMenuItem(value: 'setting', child: Text("Settings"))
            ],
            icon: Icon(Icons.menu_open_rounded),
          ),
        ],
        elevation: 4,
        shadowColor: Colors.blueAccent,
        actionsIconTheme: IconThemeData(
          color: Colors.white,
          // applyTextScaling: true,
          // opticalSize: 10,
          size: 24,
          // weight: 40,
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        // excludeHeaderSemantics: false,
        // notificationPredicate: (notification) {},
        // toolbarHeight: 50,
        forceMaterialTransparency: false,
        // bottom: ,
      ),
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
              height: 180,
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
      drawerEnableOpenDragGesture: true,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SizedBox(
            height: 250,
            width: 250,
            child: GestureDetector(
              onTap: () {
                Fluttertoast.showToast(
                  msg: "This Functionality Unavailable",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        "assets/images/logo.jpg",
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Brine Web",
                        style: TextStyle(fontSize: 20, fontFamily: 'Bold'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
