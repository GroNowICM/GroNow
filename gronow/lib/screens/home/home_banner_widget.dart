import 'package:flutter/material.dart';
import 'package:gronow/common_widgets/app_text.dart';
import 'package:gronow/styles/colors.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 115,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              image: AssetImage(
                "assets/images/banner_background.png",
              ),
              fit: BoxFit.cover)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.asset(
              "assets/images/banner_image.png",
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AppText(
                text: "Fresh Vegetables",
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              AppText(
                text: "Get Up To 40%  OFF",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
