import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internship/Week_1/signinForm.dart';

class dashBoardScreen extends StatefulWidget {
  const dashBoardScreen({super.key});

  @override
  State<dashBoardScreen> createState() => _dashBoardScreenState();
}

class _dashBoardScreenState extends State<dashBoardScreen> {
  String locationMessage = "";
  // ignore: unused_field
  String _locationMessage = "current address";
  String _locationMessageApbar = "current address";
  bool _isLoading = false;
  bool start = true;
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    setState(() {
      _isLoading = true;
    });

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationMessage = "Location services are disabled.";
        _isLoading = true;
      });
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationMessage = "Location permissions are denied.";
          _isLoading = true;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationMessage =
            'Location permissions are permanently denied, please go to settings.';
        _isLoading = true;
      });
      await Geolocator.openAppSettings();
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        locationMessage =
            "Latitude: ${position.latitude.toStringAsFixed(4)}\n"
            "Longitude: ${position.longitude.toStringAsFixed(4)}";
      });

      await _getAddressFromCoordinates(position);
    } catch (e) {
      setState(() {
        locationMessage = "Error getting location: ${e.toString()}";
        _isLoading = false;
      });
    }
  }

  Future<void> _getAddressFromCoordinates(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        String formattedAddress =
            "${place.street}, "
            "${place.subLocality}, "
            "${place.locality}, "
            "${place.postalCode}, "
            "${place.country}";

        String addressAapBar =
            // "${place.street ?? ''}, "
            "${place.subLocality},"
            "${place.locality} ";

        setState(() {
          _locationMessage = formattedAddress;
          _locationMessageApbar = addressAapBar;
          _isLoading = false;
        });
      } else {
        setState(() {
          _locationMessage = "Location found, but address not available.";
          _isLoading = true;
        });
      }
    } catch (e) {
      setState(() {
        _locationMessage = "Error during address conversion: ${e.toString()}";
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
          leading: Container(
            margin: EdgeInsets.all(6),
            child: ClipOval(
              child: Image.asset(
                "assets/images/logo.jpg",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Change Outlet",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                _locationMessageApbar,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInForm()),
                );
              },
              icon: Icon(Icons.person, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _isLoading = false;
                });
                if (!_isLoading) {
                  _determinePosition();
                }
              },
              icon: Icon(Icons.location_on, color: Colors.white),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade400, width: 1),
                  ),
                  child: TabBar(
                    tabs: [
                      Tab(text: "Delivery"),
                      Tab(text: "Pickup"),
                      Tab(text: "Dine-In"),
                    ],
                    labelStyle: TextStyle(fontFamily: 'SemiBold', fontSize: 14),
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 8),
                      ],
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                ),

                Center(
                  child: Text(
                    "Lowest Prices Guaranted on La Pino's Pizza!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Container(
                  height: 210,
                  width: 320,
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FLAT 50% OFF",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Bold',
                        ),
                      ),
                      Text(
                        "on Order Above Rs.200",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Semibold',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Not Valid on BOGO,Beverages,\nClassic Pizzas,Slash Manu",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontFamily: 'Semibold',
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        height: 36,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Use Code: LPNEW50",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Semibold',
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Valid for New User Only",
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                          fontFamily: 'Semibold',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
