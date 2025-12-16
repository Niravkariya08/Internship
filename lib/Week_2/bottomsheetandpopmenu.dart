import 'package:flutter/material.dart';

class Bottomsheetandpopmenu extends StatefulWidget {
  const Bottomsheetandpopmenu({super.key});

  @override
  State<Bottomsheetandpopmenu> createState() => _BottomsheetandpopmenuState();
}

class _BottomsheetandpopmenuState extends State<Bottomsheetandpopmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              PopupMenuItem(value: 'setting', child: Text("Settings")),
              PopupMenuItem(value: 'Account', child: Text("Account")),
              PopupMenuItem(value: 'Log Out', child: Text("Log out")),
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
    );
  }
}
