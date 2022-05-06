import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:beacon_broadcast/beacon_broadcast.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:location/location.dart';

import '../../styles/colors.dart';

class CourierBeaconScreen extends StatefulWidget {
  const CourierBeaconScreen({Key? key}) : super(key: key);

  @override
  State<CourierBeaconScreen> createState() => _CourierBeaconScreenState();
}

class _CourierBeaconScreenState extends State<CourierBeaconScreen> {
  FlutterBlue fb = FlutterBlue.instance;
  Location location = Location();
  BeaconBroadcast beaconBroadcast = BeaconBroadcast();

  void startBroadcast() async {
    if (await fb.isOn) {
      beaconBroadcast
          .setUUID("FF11EE22-DD33-CC44-BB55-AA6699778888")
          .setMajorId(1)
          .setMinorId(100)
          .start();
      log("Broadcasting");
    }
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
                    child: const Text("Start Scanning"),
                  ),
                  margin: const EdgeInsets.all(8),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () async {},
                    child: const Text("Stop Scanning"),
                  ),
                  margin: const EdgeInsets.all(8),
                ),
              ],
            ),
          ),
        ));
  }
}
