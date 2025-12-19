import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationDemo extends StatefulWidget {
  const LocationDemo({super.key});

  @override
  State<LocationDemo> createState() => _LocationDemoState();
}

class _LocationDemoState extends State<LocationDemo> {
  String locationMessage = "";
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
      await Geolocator.openAppSettings();
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
            "${place.street ?? ''}, "
            "${place.subLocality ?? ''}, "
            "${place.locality ?? ''}, "
            "${place.postalCode ?? ''}, "
            "${place.country ?? ''}";

        String addressAapBar =
            "${place.street ?? ''}, "
            "${place.subLocality ?? ''}, "
            "${place.locality ?? ''} ";

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _locationMessageApbar,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Coordinates:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              _isLoading == true
                  ? CircularProgressIndicator()
                  : Text(
                      locationMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
              SizedBox(height: 30),
              Text(
                "Address:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              _isLoading == true
                  ? CircularProgressIndicator()
                  : Text(
                      _locationMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),

              SizedBox(height: 40),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isLoading = false;
                  });
                  if (!_isLoading) {
                    _determinePosition();
                  }
                },
                icon: Icon(Icons.location_on, size: 50, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
