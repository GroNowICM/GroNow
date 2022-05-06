import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:location/location.dart';

class BeaconScreen extends StatefulWidget {
  const BeaconScreen({Key? key}) : super(key: key);

  @override
  State<BeaconScreen> createState() => _BeaconScreenState();
}

class _BeaconScreenState extends State<BeaconScreen> {
  FlutterBlue fb = FlutterBlue.instance;
  Location location = Location();
  StreamSubscription<RangingResult>? _streamRanging;
  void startScanning() async {
    if (await fb.isOn) {
      try {
        // or if you want to include automatic checking permission
        await flutterBeacon.initializeAndCheckScanning;
      } on PlatformException catch (e) {
        log("There was an error" + e.message.toString());
      }
      final regions = <Region>[];
      log("Scanning for beacons...");
      if (Platform.isIOS) {
        // iOS platform, at least set identifier and proximityUUID for region scanning
        regions.add(Region(
            identifier: 'Apple Airlocate',
            proximityUUID: 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'));
      } else {
        // android platform, it can ranging out of beacon that filter all of Proximity UUID
        log("Device is Android");
        regions.add(Region(identifier: 'com.beacon'));
      }

// to start ranging beacons
      _streamRanging =
          flutterBeacon.ranging(regions).listen((RangingResult result) {
        // result contains a region and list of beacons found
        // list can be empty if no matching beacons were found in range
      });
      _streamRanging?.onData((data) {
        log(data.toString());
      });
    }
  }

  void stopScanning() {
    _streamRanging?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  startScanning();
                },
                child: const Text("Start Scanning"),
              ),
              margin: const EdgeInsets.all(8),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  stopScanning();
                },
                child: const Text("Stop Scanning"),
              ),
              margin: const EdgeInsets.all(8),
            ),
          ],
        ),
      ),
    );
  }
}
