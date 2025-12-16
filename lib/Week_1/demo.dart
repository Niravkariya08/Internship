import 'package:flutter/material.dart';

//DAY 1

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: "App",
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text(
                  'Drawer Demo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Item 1'),
              ),
              ListTile(
                title: Text('Item 2'),
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text("Add To Cart",style: TextStyle(fontSize: 24),),
              SizedBox(height: 50,),
              TextButton(onPressed: () {

              }, child: Text("Submit",style: TextStyle(fontSize: 30),)),
              IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Setting Button',
                onPressed: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
            title: Text("Appbar of Application",style: TextStyle(fontSize: 30),),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: Text("Hello Word",style: TextStyle(fontSize: 34,color:Colors.blue),),
        ),
      ),
    );
  }
}
