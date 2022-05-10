import 'package:flutter/material.dart';
import 'package:gronow/screens/beacon-courier/beacon.dart';
import 'package:gronow/screens/login_screen.dart';
import 'package:gronow/screens/map/map.dart';
import 'package:gronow/styles/colors.dart';

class courierscreen extends StatelessWidget {
  const courierscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              body: const TabBarView(
                  children: [CourierBeaconScreen(), MapScreen()]),
              appBar: AppBar(
                  actions: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage(
                                          title: 'Login UI',
                                        )));
                          },
                          child: const Icon(
                            Icons.logout,
                            size: 22.0,
                          ),
                        ))
                  ],
                  backgroundColor: AppColors.primaryColor,
                  title: const Text("Welcome to GroNow",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      )),
                  bottom: const TabBar(tabs: [
                    Tab(icon: Icon(Icons.bluetooth)),
                    Tab(icon: Icon(Icons.map))
                  ])),
            )));
  }
}
