import 'package:flutter/material.dart';
import 'package:internship/DashBoard.dart';
import 'package:internship/Weel_3/otpsigninscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      home: myapp2(),
    );
  }
}

class myapp2 extends StatefulWidget {
  const myapp2({super.key});

  @override
  State<myapp2> createState() => myapp2State();
}

class myapp2State extends State<myapp2> {
  var isLogedin;
  static const String KEYLOGIN = 'isLogin';
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    isLogedin = sharedPref.getBool(KEYLOGIN) ?? false;
    print(isLogedin);
    if (isLogedin != null) {
      if (isLogedin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else {
        //for Logout
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OtpSigninScreen()),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OtpSigninScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
