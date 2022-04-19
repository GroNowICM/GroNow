import 'package:flutter/material.dart';
import 'package:gronow/common_widgets/app_button.dart';
import 'package:gronow/common_widgets/app_text.dart';

import '../order_failed_dialog.dart';

class CheckoutBottomSheet extends StatefulWidget {
  const CheckoutBottomSheet({Key? key}) : super(key: key);

  @override
  _CheckoutBottomSheetState createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Wrap(
        children: <Widget>[
          Row(
            children: [
              const AppText(
                text: "Checkout",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 25,
                  ))
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          getDivider(),
          checkoutRow("Delivery", trailingText: "Select Method"),
          getDivider(),
          checkoutRow("Payment", trailingWidget: const Icon(Icons.payment)),
          getDivider(),
          checkoutRow("Promo Code", trailingText: "Pick Discount"),
          getDivider(),
          checkoutRow("Total Cost", trailingText: "\$13.97"),
          getDivider(),
          const SizedBox(
            height: 30,
          ),
          termsAndConditionsAgreement(context),
          Container(
            margin: const EdgeInsets.only(
              top: 25,
            ),
            child: AppButton(
              label: "Place Order",
              fontWeight: FontWeight.w600,
              padding: const EdgeInsets.symmetric(
                vertical: 25,
              ),
              onPressed: () {
                onPlaceOrderClicked();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getDivider() {
    return const Divider(
      thickness: 1,
      color: Color(0xFFE2E2E2),
    );
  }

  Widget termsAndConditionsAgreement(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'By placing an order you agree to our',
          style: TextStyle(
            color: const Color(0xFF7C7C7C),
            fontSize: 14,
            fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
            fontWeight: FontWeight.w600,
          ),
          children: const [
            TextSpan(
                text: " Terms",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            TextSpan(text: " And"),
            TextSpan(
                text: " Conditions",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ]),
    );
  }

  Widget checkoutRow(String label,
      {String? trailingText, Widget? trailingWidget}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        children: [
          AppText(
            text: label,
            fontSize: 18,
            color: const Color(0xFF7C7C7C),
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
          trailingText == null
              ? trailingWidget!
              : AppText(
                  text: trailingText,
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )
        ],
      ),
    );
  }

  void onPlaceOrderClicked() {
    Navigator.pop(context);
    showDialog(
        builder: (context) => const OrderFailedDialogue(), context: context);
  }
}
