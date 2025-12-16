import 'package:flutter/material.dart';

class Searchpagedemo extends StatefulWidget {
  const Searchpagedemo({super.key});

  @override
  State<Searchpagedemo> createState() => _SearchpagedemoState();
}

class _SearchpagedemoState extends State<Searchpagedemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Search Here'),
          ),
        ),
      ),
    );
  }
}
