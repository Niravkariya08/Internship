import 'package:flutter/material.dart';

class StackDemo extends StatefulWidget {
  const StackDemo({super.key});

  @override
  State<StackDemo> createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Hello"),
              Tab(text: "World"),
              Tab(text: "Flutter"),
            ],
            // automaticIndicatorColorAdjustment: false,
            // dividerColor: Colors.blue,
            // dividerHeight: 2,
            // labelColor: Colors.red,
            // indicatorColor: Colors.red,
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(height: 250, width: 250, color: Colors.orange),
                Container(height: 150, width: 150, color: Colors.red),
                Container(height: 50, width: 50, color: Colors.blue),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      surfaceTintColor: Colors.blue[100],
                      title: Row(
                        children: [
                          Icon(Icons.shopping_cart),
                          SizedBox(width: 12),
                          Text("Shopping Cart"),
                        ],
                      ),
                      content: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: CircleAvatar(
                            maxRadius: 30,
                            backgroundImage: AssetImage(
                              "assets/images/logo.jpg",
                            ),
                          ),
                        ),
                        title: Text("App Devloper"),
                        subtitle: Text("Brine Web"),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Bas Ne karyu ne Remove"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 5),
                              ),
                            );
                          },
                          icon: Icon(Icons.close),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Thank For Shopping"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                              ),
                            );
                          },
                          child: Text("Done"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Click"),
            ),
          ],
        ),
      ),
    );
  }
}
