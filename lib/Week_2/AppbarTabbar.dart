import 'package:flutter/material.dart';

class AppbarTabbarTask extends StatefulWidget {
  const AppbarTabbarTask({super.key});

  @override
  State<AppbarTabbarTask> createState() => _AppbarTabbarTaskState();
}

class _AppbarTabbarTaskState extends State<AppbarTabbarTask> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          elevation: 8,
          shadowColor: Colors.black38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
          leading: Icon(Icons.notifications),
          titleSpacing: 18,
          title: Text(
            "Service Appointments",
            style: TextStyle(fontFamily: 'Bold', fontSize: 20),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade400, width: 1),
              ),
              child: TabBar(
                tabs: [
                  Tab(text: "Upcoming"),
                  Tab(text: "Past"),
                  Tab(text: "Request"),
                ],
                labelStyle: TextStyle(fontFamily: 'SemiBold', fontSize: 14),
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.transparent,
                splashBorderRadius: BorderRadius.all(Radius.circular(26)),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.red,
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 4,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Upcoming")),
            Center(child: Text("Past")),
            Center(child: Text("Request")),
          ],
        ),
      ),
    );
  }
}
