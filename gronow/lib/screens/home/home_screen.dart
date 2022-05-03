import 'package:flutter/material.dart';
import 'package:gronow/models/grocery_item.dart';
import 'package:gronow/screens/product_details/product_details_screen.dart';
import 'package:gronow/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gronow/widgets/grocery_item_card_widget.dart';
import 'package:gronow/widgets/search_bar_widget.dart';
import 'package:gronow/screens/home/cameraScreen.dart';
import 'grocery_featured_Item_widget.dart';
import 'home_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: SvgPicture.asset(
          "assets/icons/front.svg",
          fit: BoxFit.scaleDown,
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 242, 245),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Camera'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return CameraScreen();
                  },
                ));
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                padded(const SearchBarWidget()),
                const SizedBox(
                  height: 25,
                ),
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
                padded(subTitle("Groceries")),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 105,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      GroceryFeaturedCard(
                        groceryFeaturedItems[0],
                        color: const Color(0xffF8A44C),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GroceryFeaturedCard(
                        groceryFeaturedItems[1],
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                getHorizontalItemSlider(groceries),
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
        const Text(
          "See All",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
