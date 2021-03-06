import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gronow/main.dart';
import 'package:gronow/models/grocery_item.dart';
import 'package:gronow/screens/login_screen.dart';
import 'package:gronow/screens/map/map.dart';
import 'package:gronow/screens/product_details/product_details_screen.dart';
import 'package:gronow/styles/colors.dart';
import 'package:gronow/widgets/grocery_item_card_widget.dart';
import 'package:gronow/screens/home/camera_screen.dart';
import 'package:gronow/screens/beacon-client/beacon.dart';

import '../cart/cart_screen.dart';
import 'home_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ))),
      drawer: Drawer(
        backgroundColor: AppColors.lightGrey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                  ),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/icons/app_icon_color.svg",
                      alignment: Alignment.topLeft,
                      height: 100,
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Column(children: [
                      SvgPicture.asset(
                        "assets/icons/account_icon.svg",
                        alignment: Alignment.topRight,
                        height: 90,
                      ),
                      Text(
                        globaluser,
                        textScaleFactor: 2.3,
                      )
                    ])
                  ])),
              Wrap(
                // Important: Remove any padding from the ListView.
                runSpacing: 10,
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera_alt_outlined),
                    title: const Text(
                      'Camera',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const CameraScreen();
                        },
                      ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.map_outlined),
                    title: const Text(
                      'Map',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const MapScreen();
                        },
                      ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.bluetooth),
                    title: const Text(
                      'Find Courier',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const ClientBeaconScreen();
                        },
                      ));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text(
                      'Cart',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                padded(const HomeBanner()),
                const SizedBox(
                  height: 25,
                ),
                padded(subTitle("Exclusive Order")),
                getHorizontalItemSlider(exclusiveOffers),
                const SizedBox(
                  height: 15,
                ),
                padded(subTitle("Best Selling")),
                getHorizontalItemSlider(bestSelling),
                const SizedBox(
                  height: 15,
                ),
                padded(subTitle("Meats")),
                getHorizontalItemSlider(meats),
                const SizedBox(
                  height: 15,
                ),
                padded(subTitle("Legumes")),
                getHorizontalItemSlider(legumes),
                const SizedBox(
                  height: 15,
                ),
                padded(subTitle("Beverages")),
                getHorizontalItemSlider(beverages),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget padded(Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }

  Widget getHorizontalItemSlider(List<GroceryItem> items) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onItemClicked(context, items[index]);
            },
            child: GroceryItemCardWidget(
              item: items[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  void onItemClicked(BuildContext context, GroceryItem groceryItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(groceryItem)),
    );
  }

  Widget subTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
      ],
    );
  }
}
