import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gronow/styles/colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Future<LatLng> _getLocation() async {
    bool locationPermission = await Permission.location.status.isGranted;
    LatLng _center = const LatLng(40.64165860185367, -8.653554472528402);
    if (locationPermission) {
      Location loc = Location();
      try {
        LocationData _locData = await loc.getLocation();
        _center =
            LatLng(_locData.latitude as double, _locData.longitude as double);
      } on Exception catch (exc, e) {
        log("THERE WAS AN EXCEPTION: " + exc.toString() + " " + e.toString());
      }
    }
    return _center;
  }

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    Location location = Location();
    if (await Permission.location.serviceStatus.isEnabled) {
      if (!(await Permission.location.status.isGranted)) {
        location.requestPermission();
        setState(() {});
        if (await Permission.location.isPermanentlyDenied) {
          openAppSettings();
          setState(() {});
        }
      }
    } else {
      await location.requestService();
    }
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Map"),
          backgroundColor: AppColors.primaryColor,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: _getLocation(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                return GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: {
                    Marker(
                      markerId: MarkerId(snapshot.data.toString()),
                      position: snapshot.data as LatLng,
                      infoWindow: const InfoWindow(title: "You"),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueOrange),
                    ),
                  },
                  initialCameraPosition: CameraPosition(
                      target: snapshot.data as LatLng, zoom: 15.5),
                );
              }),
        ));
  }
}
