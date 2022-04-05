import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    LatLng _center = LatLng(40.64165860185367, -8.653554472528402);
    if (locationPermission) {
      Location loc = new Location();
      LocationData _locData = await loc.getLocation();
      _center =
          LatLng(_locData.latitude as double, _locData.longitude as double);
    }
    return _center;
  }

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    Location location = new Location();
    if (await Permission.location.serviceStatus.isEnabled) {
      if (!(await Permission.location.status.isGranted)) {
        if (await Permission.location.isPermanentlyDenied) {
          openAppSettings();
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
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: _getLocation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            print("aaaaaaaaaaaaaaaaaaaa");
            print(snapshot.data);
            return GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition:
                  CameraPosition(target: snapshot.data as LatLng, zoom: 11.0),
            );
          }),
    ));
  }
}
