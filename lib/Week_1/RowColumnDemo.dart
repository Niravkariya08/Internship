import 'package:flutter/material.dart';

// DAY 2

class Rowcolumndemo extends StatelessWidget {
  const Rowcolumndemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent,title: Text("This is Row & Column Demo",style: TextStyle(fontSize: 24),),),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.redAccent,
                  ),
                ),Expanded(
                  child: Container(
                    color: Colors.white30,
                  ),
                ),Expanded(
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellowAccent,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
  }
}
