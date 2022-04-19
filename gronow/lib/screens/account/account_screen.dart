import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gronow/common_widgets/app_text.dart';
import 'package:gronow/helpers/column_with_seprator.dart';
import 'package:gronow/styles/colors.dart';
import '../order_failed_dialog.dart';
import 'account_item.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderFailedDialogue()),
                );
              },
              leading: SizedBox(width: 65, height: 65, child: getImageHeader()),
              title: const AppText(
                text: "Mohammed Hashim",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              subtitle: const AppText(
                text: "github.com/mohammedhashim44",
                color: Color(0xff7C7C7C),
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            Column(
              children: getChildrenWithSeperator(
                widgets: accountItems.map((e) {
                  return getAccountItemWidget(e);
                }).toList(),
                seperator: const Divider(
                  thickness: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            logoutButton(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 0.0,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 25),
          onPrimary: const Color(0xffF2F3F2),
          textStyle: const TextStyle(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                "assets/icons/account_icons/logout_icon.svg",
              ),
            ),
            const Text(
              "Log Out",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Container()
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget getImageHeader() {
    String imagePath = "assets/images/account_image.jpg";
    return CircleAvatar(
      radius: 5.0,
      backgroundImage: AssetImage(imagePath),
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
    );
  }

  Widget getAccountItemWidget(AccountItem accountItem) {
    return InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  accountItem.iconPath,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                accountItem.label,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ));
  }
}
