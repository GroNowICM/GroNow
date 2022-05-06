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
          .setLayout('m:2-3=0215,i:4-19,i:20-21,i:22-23,p:24-24')
          .setManufacturerId(0x004c)
          .start();
      log("Broadcasting");
    }
  }

  void stopBroadcast() async {
    beaconBroadcast.stop();
    log("Stopping broadcast");
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
                    onPressed: () async {
                      stopBroadcast();
                    },
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
