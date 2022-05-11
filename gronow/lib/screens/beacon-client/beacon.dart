import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:location/location.dart';

import '../../styles/colors.dart';

class ClientBeaconScreen extends StatefulWidget {
  const ClientBeaconScreen({Key? key}) : super(key: key);

  @override
  State<ClientBeaconScreen> createState() => _ClientBeaconScreenState();
}

class _ClientBeaconScreenState extends State<ClientBeaconScreen> {
  FlutterBlue fb = FlutterBlue.instance;
  Location location = Location();
  StreamSubscription<RangingResult>? _streamRanging;

  sendNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      } else {
        AwesomeNotifications().createNotification(
            content: NotificationContent(
                id: 10,
                channelKey: 'basic_channel',
                title: 'GroNow Arrived',
                body: 'Your Courier just arrived, go there!'));
      }
    });
  }

  void startScanning() async {
    if (await fb.isOn) {
      try {
        await flutterBeacon.initializeAndCheckScanning;
      } on PlatformException catch (e) {
        log("There was an error" + e.message.toString());
      }
      final regions = <Region>[];
      log("Scanning for beacons...");
      if (Platform.isIOS) {
        regions.add(Region(
            identifier: 'Apple Airlocate',
            proximityUUID: 'E2C56DB5-DFFB-48D2-B060-D0F5A71096E0'));
      } else {
        regions.add(Region(identifier: 'gronow.client'));
      }

      _streamRanging =
          flutterBeacon.ranging(regions).listen((RangingResult result) {
        log("checking for results");
      });
      _streamRanging?.onData((data) {
        for (var i = 0; i < data.beacons.length; i++) {
          if (data.beacons[i].proximityUUID ==
              "FF11EE22-DD33-CC44-BB55-AA6699778888") {
            sendNotification();
            stopScanning();
          }
        }
      });
    }
  }

  void stopScanning() {
    _streamRanging?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Client Beacon"),
        backgroundColor: AppColors.primaryColor,
      ),
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
