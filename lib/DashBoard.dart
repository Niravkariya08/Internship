import 'package:flutter/material.dart';
import 'package:internship/Extra/dashboard.dart';
import 'package:internship/Week_1/CardDemo.dart';
import 'package:internship/Week_1/FormDemo.dart';
import 'package:internship/Week_1/GridView.dart';
import 'package:internship/Week_1/ImgTextButtonDemo.dart';
import 'package:internship/Week_1/ListViewDemoBuilder.dart';
import 'package:internship/Week_1/ListViewDemoBuilderListTile.dart';
import 'package:internship/Week_1/RowColumnDemo.dart';
import 'package:internship/Week_1/signinForm.dart';
import 'package:internship/Week_2/AppbarTabbar.dart';
import 'package:internship/Week_2/CustomBottomNavBar.dart';
import 'package:internship/Week_2/Picker.dart';
import 'package:internship/Week_2/appbardrawerDemo.dart';
import 'package:internship/Week_2/appbardrawertask.dart';
import 'package:internship/Week_2/bottomsheetandpopmenu.dart';
import 'package:internship/Week_2/locationDemo.dart';
import 'package:internship/Week_2/stackdemo.dart';
import 'package:internship/Week_2/swiperdemo.dart';
import 'package:internship/Weel_3/otppage.dart';
import 'package:internship/Weel_3/otpsigninscreen.dart';
import 'package:internship/Weel_3/splashscreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget _buildDashboardButton(
    BuildContext context,
    String title,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRow(
    BuildContext context,
    String title1,
    Widget page1,
    String title2,
    Widget page2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildDashboardButton(
            context,
            title1,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page1),
            ),
          ),
          const SizedBox(width: 15),
          _buildDashboardButton(
            context,
            title2,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page2),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildTextDivider('Week 1'),
                SizedBox(height: 10),
                _buildButtonRow(
                  context,
                  "Row-Column",
                  Rowcolumndemo(),
                  "Images",
                  Imgtextbuttondemo(),
                ),

                _buildButtonRow(
                  context,
                  "Registration",
                  Formdemo(),
                  "Sign In",
                  SignInForm(),
                ),

                _buildButtonRow(
                  context,
                  "Cards",
                  CardDemo(),
                  "UserList",
                  ListviewDemo(),
                ),
                _buildButtonRow(
                  context,
                  "InstaChats",
                  Listviewdemobuilderlisttile(),
                  "Grid view",
                  GridviewDemo(),
                ),
                SizedBox(height: 10),
                buildTextDivider('Week 2'),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Appbardrawerdemo(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                        child: Text(
                          "AppBar & Drawer & Navbar",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                _buildButtonRow(
                  context,
                  "Custom Bottom Navbar",
                  CustomBottomNavbar(),
                  "BottomSheet & Popup Menu",
                  Bottomsheetandpopmenu(),
                ),
                _buildButtonRow(
                  context,
                  "Task",
                  AppbarDrawerTask(),
                  "Stack",
                  StackDemo(),
                ),
                _buildButtonRow(
                  context,
                  "TabbarTask",
                  AppbarTabbarTask(),
                  "Swiper Demo",
                  SwiperDemo(),
                ),
                _buildButtonRow(
                  context,
                  "PickerDemo",
                  PickerDemo(),
                  "Location Demo",
                  LocationDemo(),
                ),
                SizedBox(height: 10),
                buildTextDivider('Week 3'),
                SizedBox(height: 10),
                _buildButtonRow(
                  context,
                  "OTPSign",
                  OtpSigninScreen(),
                  "SplashScreen",
                  splashScreenDemo(),
                ),
                SizedBox(height: 10),
                buildTextDivider('Extra'),
                SizedBox(height: 10),
                _buildButtonRow(
                  context,
                  "La Pino's Pizza",
                  dashBoardScreen(),
                  "Demo",
                  dashBoardScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextDivider(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Divider(
          indent: 0.0,
          endIndent: 10.0,
          thickness: 1,
          color: Colors.grey,
        ),
      ),
      Text(
        text,
        style: TextStyle(
          color: Color.fromARGB(255, 174, 181, 184),
          fontFamily: 'Bold',
        ),
      ),
      Expanded(
        child: Divider(
          indent: 10.0,
          endIndent: 0.0,
          thickness: 1,
          color: Colors.grey,
        ),
      ),
    ],
  );
}
