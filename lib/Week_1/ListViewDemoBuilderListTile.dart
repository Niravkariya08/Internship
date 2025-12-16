import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserDetails {
  final String name;
  final String number;
  final String email;
  final String city;
  final String message;
  final String imageUrl;

  UserDetails({
    required this.name,
    required this.number,
    required this.email,
    required this.city,
    required this.message,
    required this.imageUrl,
  });
}

class Listviewdemobuilderlisttile extends StatefulWidget {
  const Listviewdemobuilderlisttile({super.key});

  @override
  State<Listviewdemobuilderlisttile> createState() =>
      _ListviewdemobuilderlisttileState();
}

class _ListviewdemobuilderlisttileState
    extends State<Listviewdemobuilderlisttile> {
  final List<UserDetails> User = [
    UserDetails(
      name: "Nirav Kariya",
      number: "9104934920",
      email: "niravkariya@gmail.com",
      city: "Gondal",
      message: "Welcome back!",
      imageUrl:
          "https://www.bing.com/images/search?view=detailV2&ccid=QydRfeQx&id=B07071D7223561237E17365BCABF0E5B4250053D&thid=OIP.QydRfeQxu5W10sbxutOzSQAAAA&mediaurl=https%3a%2f%2fmedia.designrush.com%2fagencies%2f533753%2fconversions%2fBrine-Web-logo-profile.jpg&exph=150&expw=300&q=brine+web+&FORM=IRPRST&ck=1352A857425C7D7441599D7D1D2107A9&selectedIndex=3&itb=0",
    ),
    UserDetails(
      name: "Ansh Kariya",
      number: "9104934921",
      email: "anshkariya@gmail.com",
      city: "Gondal",
      message: "Let's connect soon.",
      imageUrl: "https://example.com/images/default.png",
    ),
    UserDetails(
      name: "Shyam Khimani",
      number: "9104934922",
      email: "shyamkhimani@gmail.com",
      city: "Rajkot",
      message: "Just a quick hello!",
      imageUrl: "https://example.com/images/default.png",
    ),
    UserDetails(
      name: "Priya Sharma",
      number: "9876543210",
      email: "priya.sharma@example.com",
      city: "Mumbai",
      message: "Wishing you a great day!",
      imageUrl: "https://images.unsplash.com/photo-1544005313-914a4b2a8d30",
    ),
    UserDetails(
      name: "Rohit Verma",
      number: "8888877777",
      email: "rohit.verma@example.com",
      city: "Delhi",
      message:
          "Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.",
      imageUrl: "https://images.unsplash.com/photo-1599839446734-fe529a6b9948",
    ),
    UserDetails(
      name: "Aisha Singh",
      number: "7000123456",
      email: "aisha.singh@example.com",
      city: "Bangalore",
      message: "Call me when you are free.",
      imageUrl: "https://images.unsplash.com/photo-1502823403499-6cc5c157fdc4",
    ),
    UserDetails(
      name: "Karthik Menon",
      number: "9999900000",
      email: "karthik.menon@example.com",
      city: "Chennai",
      message: "See you next week!",
      imageUrl: "",
    ),
    UserDetails(
      name: "Nirav Kariya",
      number: "9104934920",
      email: "niravkariya@gmail.com",
      city: "Gondal",
      message: "Welcome back!",
      imageUrl:
          "https://www.bing.com/images/search?view=detailV2&ccid=QydRfeQx&id=B07071D7223561237E17365BCABF0E5B4250053D&thid=OIP.QydRfeQxu5W10sbxutOzSQAAAA&mediaurl=https%3a%2f%2fmedia.designrush.com%2fagencies%2f533753%2fconversions%2fBrine-Web-logo-profile.jpg&exph=150&expw=300&q=brine+web+&FORM=IRPRST&ck=1352A857425C7D7441599D7D1D2107A9&selectedIndex=3&itb=0",
    ),
    UserDetails(
      name: "Ansh Kariya",
      number: "9104934921",
      email: "anshkariya@gmail.com",
      city: "Gondal",
      message: "Let's connect soon.",
      imageUrl: "https://example.com/images/default.png",
    ),
    UserDetails(
      name: "Shyam Khimani",
      number: "9104934922",
      email: "shyamkhimani@gmail.com",
      city: "Rajkot",
      message: "Just a quick hello!",
      imageUrl: "https://example.com/images/default.png",
    ),
    UserDetails(
      name: "Priya Sharma",
      number: "9876543210",
      email: "priya.sharma@example.com",
      city: "Mumbai",
      message: "Wishing you a great day!",
      imageUrl: "https://images.unsplash.com/photo-1544005313-914a4b2a8d30",
    ),
    UserDetails(
      name: "Rohit Verma",
      number: "8888877777",
      email: "rohit.verma@example.com",
      city: "Delhi",
      message:
          "Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.Project updates are ready.",
      imageUrl: "https://images.unsplash.com/photo-1599839446734-fe529a6b9948",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder Demo"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: User.length,
          itemBuilder: (context, index) {
            final Users = User[index];
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: ListTile(
                  minLeadingWidth: 0,
                  horizontalTitleGap: 5,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/ram.jpg"),
                    // child: Text("AB"),
                    radius: 24,
                  ),
                  title: Text(
                    Users.name,
                    style: TextStyle(fontFamily: 'Semibold'),
                  ),
                  subtitle: Text(
                    Users.message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: "This Functionality Unavailable",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black45,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    child: Icon(Icons.camera_alt),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
