import 'package:flutter/material.dart';

class AppbarDrawerTask extends StatefulWidget {
  const AppbarDrawerTask({super.key});

  @override
  State<AppbarDrawerTask> createState() => _AppbarDrawerTaskState();
}

class _AppbarDrawerTaskState extends State<AppbarDrawerTask> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  String userName = "";
  String userAbout = "";
  final formkey = GlobalKey<FormState>();
  List<dynamic> get screens => [
    Text("Home"),
    Text("Search"),
    Center(
      child: userName.isNotEmpty
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'User : $userName',
                    style: TextStyle(fontFamily: 'SemiBold'),
                  ),
                  SizedBox(height: 12),
                  Text(userAbout),
                ],
              ),
            )
          : Text("No Data"),
    ),
    Text("Reels"),
    Text("Account"),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Search"),
              Tab(text: "Profile"),
            ],
          ),
          // leading: Builder(
          //   builder: (context) => TextButton(
          //     onPressed: () {
          //       Scaffold.of(context).openDrawer();
          //     },
          //     child: SizedBox(
          //       height: 200,
          //       width: 200,
          //       child: Image.asset("assets/images/hello.png", fit: BoxFit.cover),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          //   width: 20,
          //   child: Image.asset("assets/images/hello.png", fit: BoxFit.fitWidth),
          // ),
          leadingWidth: 100,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
          ),
          actions: [
            Container(
              height: 42,
              width: 42,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_active),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),

                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
            SizedBox(width: 12),
            Container(
              height: 42,
              width: 42,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.email)),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),

                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
            SizedBox(width: 12),
            // OutlinedButton(
            //   // style: ButtonStyle(shape:RoundedRectangleBorder()),
            //   onPressed: () {},
            //   child: Icon(Icons.notifications_active),
            // ),
            // OutlinedButton(
            //   // style: ButtonStyle(shape:RoundedRectangleBorder()),
            //   onPressed: () {},
            //   child: Icon(Icons.email),
            // ),
          ],
        ),
        drawer: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
          ),
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              // DrawerButton(
              //   color: Colors.black,
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
              Column(
                children: [
                  SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      maxRadius: 40,
                      minRadius: 20,
                      backgroundImage: AssetImage("assets/images/logo.jpg"),
                    ),
                  ),
                  Text(
                    "Brine Web",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Bold',
                    ),
                  ),
                  Text(
                    "brineweb@gmail.com",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(leading: Icon(Icons.settings), title: Text("Sign in")),
              ListTile(leading: Icon(Icons.info), title: Text("Registration")),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Center(child: screens[currentIndex]),
        bottomNavigationBar: Container(
          height: 80,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,

            boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 8)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItems(Icons.home, 'Home', 0),
              NavItems(Icons.search, 'Search', 1),
              NavItems(Icons.add, '', 2),
              NavItems(Icons.video_camera_back, 'Reels', 3),
              NavItems(Icons.person, 'Account', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget NavItems(IconData icon, String label, int index) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        index == 2
            ? _bottomsheetcustom()
            : setState(() {
                currentIndex = index;
              });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: isSelected ? 30 : 28,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: isSelected ? 14 : 12,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  _bottomsheetcustom() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: 400,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Text(
                    "User Form",
                    style: TextStyle(fontFamily: 'Bold', fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    // scrollPadding: EdgeInsets.only(bottom: 400),
                    controller: namecontroller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Name";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: aboutcontroller,
                    textInputAction: TextInputAction.done,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Enter About',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter About";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Close"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            print(namecontroller.text);
                            print(aboutcontroller.text);
                            Navigator.pop(context);
                            setState(() {
                              currentIndex = 2;
                              userName = namecontroller.text;
                              userAbout = aboutcontroller.text;
                            });
                            namecontroller.clear();
                            aboutcontroller.clear();
                          }
                        },
                        child: Text("Submit"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
