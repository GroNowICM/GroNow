import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../styles/colors.dart';

class CourierBeaconScreen extends StatefulWidget {
  CourierBeaconScreen({Key? key}) : super(key: key);

  @override
  State<CourierBeaconScreen> createState() => _CourierBeaconScreenState();
}

class _CourierBeaconScreenState extends State<CourierBeaconScreen> {
  FlutterBlue fb = FlutterBlue.instance;
  Location location = Location();
  late BeaconBroadcast beaconBroadcast;

  StreamSubscription<RangingResult>? _streamRanging;
  void startBroadcast() {
    beaconBroadcast = BeaconBroadcast(
        proximityUUID: 'FF11EE22-DD33-CC44-BB55-AA6699778888',
        major: 1,
        minor: 100);
    log("Broadcasting ==> BEACON: " + beaconBroadcast.proximityUUID);
  }

  void stopScanning() {
    _streamRanging?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courier Beacon"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Container(
          child: Row(
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () async {
                    startBroadcast();
                  },
                  child: Text("Start Scanning"),
                ),
                margin: EdgeInsets.all(8),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () async {
                    stopScanning();
                  },
                  child: Text("Stop Scanning"),
                ),
                margin: EdgeInsets.all(8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
