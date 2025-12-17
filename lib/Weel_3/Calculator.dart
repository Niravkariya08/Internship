import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorDemo extends StatefulWidget {
  const CalculatorDemo({super.key});

  @override
  State<CalculatorDemo> createState() => _CalculatorDemoState();
}

class _CalculatorDemoState extends State<CalculatorDemo> {
  final List<Map<String, dynamic>> Buttons = [
    //
    //
    {'color': Colors.white, 'Title': '1', 'value': '1'},
    {'color': Colors.white, 'Title': '2', 'value': '2'},
    {'color': Colors.white, 'Title': '3', 'value': '3'},
    {'color': Colors.white, 'Title': '+', 'value': ''},
    {'color': Colors.white, 'Title': '4', 'value': '4'},
    {'color': Colors.white, 'Title': '5', 'value': '5'},
    {'color': Colors.white, 'Title': '6', 'value': '6'},
    {'color': Colors.white, 'Title': '-', 'value': ''},
    {'color': Colors.white, 'Title': '7', 'value': '7'},
    {'color': Colors.white, 'Title': '8', 'value': '8'},
    {'color': Colors.white, 'Title': '9', 'value': '9'},
    {'color': Colors.white, 'Title': '*', 'value': ''},
    {'color': Colors.orange, 'Title': 'C', 'value': ''},
    {'color': Colors.white, 'Title': '0', 'value': '0'},
    {'color': Colors.white, 'Title': '/', 'value': ''},
    {'color': Colors.orange, 'Title': '=', 'value': ''},
  ];

  String ScreenItem = '';
  double num1 = 0;
  double num2 = 0;
  String operator = '';
  double subtotal = 0;
  double ans = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 430,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Calculator Demo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(8),
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(ScreenItem, style: TextStyle(fontSize: 20)),
              ),
              Container(
                height: 280,
                width: 280,
                child: GridView.builder(
                  padding: EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    childAspectRatio: 1,
                  ),
                  itemCount: Buttons.length,
                  itemBuilder: (context, index) {
                    final cardsItems = Buttons[index];
                    return GestureDetector(
                      onTap: () {
                        String title = cardsItems['Title'];

                        if (title == 'C') {
                          clean();
                          return;
                        }
                        setState(() {});
                        if (title == '+' ||
                            title == '-' ||
                            title == '*' ||
                            title == '/') {
                          num1 = double.parse(ScreenItem);
                          operator = title;
                          // ScreenItem = '';
                          ScreenItem = ScreenItem + title;
                          setState(() {});
                          return;
                        }
                        if (title == '=') {
                          List<String> parts = ScreenItem.split(operator);
                          // num2 = double.parse(ScreenItem);
                          // equal();
                          // return;
                          if (parts.length == 2) {
                            num2 = double.parse(parts[1]);
                            equal();
                          }
                          return;
                        }

                        ScreenItem += title;
                        setState(() {});
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: cardsItems['color'],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              cardsItems['Title'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clean() {
    setState(() {
      ScreenItem = '';
      num1 = 0;
      num2 = 0;
      operator = '';
    });
  }

  void equal() {
    double result = 0;

    if (operator == '+') {
      result = num1 + num2;
    } else if (operator == '-') {
      result = num1 - num2;
    } else if (operator == '*') {
      result = num1 * num2;
    } else if (operator == '/') {
      result = num1 / num2;
    }

    if (operator == '+' || operator == '-' || operator == '*') {
      setState(() {
        ScreenItem = int.parse(result.toStringAsFixed(0)).toString();
      });
    } else {
      setState(() {
        ScreenItem = result.toString();
      });
    }
  }
}
