import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';

class mapDemo extends StatefulWidget {
  const mapDemo({super.key});

  @override
  State<mapDemo> createState() => _mapDemoState();
}

class _mapDemoState extends State<mapDemo> {
  LatLng centerPosition = LatLng(21.9616567, 70.798621);
  String address = 'Aaddress';

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    getaddress();
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.checkPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position currentPosition = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 0,
        ),
      );

      setState(() {
        centerPosition = LatLng(
          currentPosition.latitude,
          currentPosition.longitude,
        );
      });
      getaddress();
    } else {
      getaddress();
    }
  }

  Future<void> getaddress() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      centerPosition.latitude,
      centerPosition.longitude,
    );
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      setState(() {
        address =
            '${place.street},${place.subLocality}, ${place.locality},${place.country}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Location Picker")),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: centerPosition,
              zoom: 16,
            ),
            onCameraMove: (CameraPosition position) {
              centerPosition = position.target;
            },
            onCameraIdle: () {
              getaddress();
            },
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: SearchAnchor(
              // viewBackgroundColor: Colors.black45,
              builder: (context, controller) {
                return GooglePlaceAutoCompleteTextField(
                  textEditingController: controller,
                  googleAPIKey: "AIzaSyC9gLMK_K5YxmKbQfVW5a6qTixAnST1dE4",
                  inputDecoration: InputDecoration(),
                  debounceTime: 800,
                  countries: ["in"],
                  isLatLngRequired: true,
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    print("placeDetails" + prediction.lng.toString());
                  },
                  itemClick: (Prediction prediction) {
                    controller.text = prediction.description!;
                    controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: prediction.description!.length),
                    );
                  },
                  itemBuilder: (context, index, Prediction prediction) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 7),
                          Expanded(
                            child: Text("${prediction.description ?? ""}"),
                          ),
                        ],
                      ),
                    );
                  },
                  seperatedBuilder: Divider(),
                  isCrossBtnShown: true,
                  placeType: PlaceType.geocode,
                );
                // SearchBar(
                //   hintText: 'Search',
                //   controller: controller,
                //   leading: Icon(Icons.search),
                //   constraints: BoxConstraints(
                //     maxHeight: 70,
                //     maxWidth: 100,
                //     minHeight: 50,
                //     minWidth: 100,
                //   ),
                //   onTap: () {
                //     controller.openView();
                //   },
                // );
              },
              suggestionsBuilder: (context, controller) {
                return [];
              },
            ),
          ),
          Center(child: Icon(Icons.location_on, color: Colors.blue, size: 40)),
        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 80,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Text(address, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
