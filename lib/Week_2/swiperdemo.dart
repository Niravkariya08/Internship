import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperDemo extends StatefulWidget {
  const SwiperDemo({super.key});

  @override
  State<SwiperDemo> createState() => _SwiperDemoState();
}

class _SwiperDemoState extends State<SwiperDemo> {
  bool isSelect = false;
  int current_index = 0;
  List<Map<dynamic, String>> images = [
    {'theme': 'Theme 1', 'img': 'assets/images/Emoji5.png'},
    {'theme': 'Theme 2', 'img': 'assets/images/Emoji2.png'},
    {'theme': 'Theme 3', 'img': 'assets/images/Emoji3.png'},
    {'theme': 'Theme 4', 'img': 'assets/images/Emoji4.png'},
    {'theme': 'Theme 5', 'img': 'assets/images/Emoji1.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 16, 45),
      appBar: AppBar(
        title: Text("Swiper Demo", style: TextStyle(fontFamily: 'Bold')),
        centerTitle: true,
      ),
      body: Swiper(
        layout: SwiperLayout.CUSTOM,
        itemWidth: 300.0,
        itemHeight: 400.0,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final data = images[index];
          final currentStatus = index == current_index;
          return SwiperCardContainer(
            data['theme']!,
            data['img']!,
            isSelect: currentStatus,
          );
        },
        onIndexChanged: (index) {
          setState(() {
            current_index = index;
          });
        },
        customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
          ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
          ..addTranslate([
            Offset(-370.0, -50.0),
            Offset(0.0, 0.0),
            Offset(370.0, -50.0),
          ]),
      ),
    );
  }

  Widget SwiperCardContainer(String theme, String img, {bool? isSelect}) {
    return Center(
      child: Container(
        height: 300,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Color.fromARGB(255, 25, 34, 62),
          border: Border.all(
            width: 3,
            color: isSelect == true ? Colors.white : Colors.transparent,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(theme, style: TextStyle(color: Colors.white)),
                  Image.asset(img, height: 110),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/images/Emoji5.png", height: 30),
                Image.asset("assets/images/Emoji2.png", height: 30),
                Image.asset("assets/images/Emoji3.png", height: 30),
                Image.asset("assets/images/Emoji4.png", height: 30),
                Image.asset("assets/images/Emoji1.png", height: 30),
              ],
            ),
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 16, 45),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Text(
                '"Simple ,steady.and clear a\npalette for calm and\nbalanced livng."',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
