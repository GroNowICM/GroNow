import 'package:flutter/material.dart';
import 'package:gronow/common_widgets/app_button.dart';
import 'package:gronow/common_widgets/app_text.dart';
import 'package:gronow/screens/home/home_screen.dart';
import 'package:gronow/screens/order_accepted_screen.dart';

class OrderFailedDialogue extends StatelessWidget {
  const OrderFailedDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        height: 600.0,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 45,
              ),
              child: Image(
                  image: AssetImage("assets/images/order_failed_image.png")),
            ),
            const Spacer(
              flex: 5,
            ),
            const AppText(
              text: "Oops! Order Failed",
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(
              flex: 2,
            ),
            const AppText(
              text: "Something went temply wrong",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff7C7C7C),
            ),
            const Spacer(
              flex: 8,
            ),
            AppButton(
              label: "Please Try Again",
              fontWeight: FontWeight.w600,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const OrderAcceptedScreen();
                }));
              },
            ),
            const Spacer(
              flex: 4,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const HomeScreen();
                  },
                ));
              },
              child: const AppText(
                text: "Back To Home",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
