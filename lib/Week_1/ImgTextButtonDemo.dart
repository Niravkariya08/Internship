import 'package:flutter/material.dart';

// DAY 2

class Imgtextbuttondemo extends StatefulWidget {
  const Imgtextbuttondemo({super.key});

  @override
  State<Imgtextbuttondemo> createState() => _ImgtextbuttondemoState();
}

class _ImgtextbuttondemoState extends State<Imgtextbuttondemo> {
  var count = 0;
  var click = false;
  // File SelectIamage = File("C:\Users\HP\OneDrive\Pictures\Screenshots\Screenshot 2025-08-23 210417.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: click == true ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text(
          'Image Text Button Demo',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            onPressed: () {
              if (click == false) {
                click = true;
              } else {
                click = false;
              }
              setState(() {});
            },
            icon: click == true ? Icon(Icons.sunny) : Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            // color: click == true ? Colors.black : Colors.white,
            child: Column(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Brine Web ",
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/ram.jpg",
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "data:image/jpeg;base64,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",
                      height: 200,
                      width: 200,
                      repeat: ImageRepeat.noRepeat,
                      filterQuality: FilterQuality.high,
                      // semanticLabel: "In Flutter, semanticLabel is a property used to provide an accessibility description for widgets, especially images.It helps screen readers (like TalkBack on Android, VoiceOver on iOS) describe what the image represents.",
                    ),
                  ],
                ),
                SizedBox(height: 30),
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Hello World From Brine Web")),
                    );
                  },
                  child: Text("Click To See Snakbar (Outline Button)"),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Count Number of Clicks : $count",
                  style: TextStyle(
                    color: click == true ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                // IconButton(
                //   color: Colors.blue,
                //   tooltip: "Increment Count",
                //   onPressed: () {
                //     setState(() {
                //       count++;
                //     });
                //   },
                //   icon: Icon(Icons.add),
                //   padding: EdgeInsets.all(10),
                // ),
                // SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    count = 0;
                    setState(() {});
                  },
                  child: Text("Reset Count (Text Button)"),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellowAccent,
                    foregroundColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    count += 10;

                    setState(() {});
                  },
                  child: Text("Count increased By 10 (ElevatedButton)"),
                  style: ButtonStyle(),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          count--;
                        });
                      },
                      child: Icon(Icons.remove),
                      tooltip: "Click to Count decreased",
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      child: Icon(Icons.add),
                      tooltip: "Click to Count increased",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
