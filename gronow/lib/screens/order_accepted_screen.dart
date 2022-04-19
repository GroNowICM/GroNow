// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gronow/common_widgets/app_button.dart';

class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 10,
            ),
            SvgPicture.asset("assets/icons/order_accepted_icon.svg"),
            const Spacer(
              flex: 8,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "You Order Has Been Accepted",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "Your item has been placed and is on it's way to being processed",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    color: const Color(0xff7C7C7C),
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Spacer(
              flex: 8,
            ),
            AppButton(
              label: "Track Order",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(
              flex: 2,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Back To Home",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }
}
