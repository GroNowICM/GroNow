import 'package:flutter/material.dart';
import 'package:gronow/screens/account/account_screen.dart';
import 'package:gronow/screens/cart/cart_screen.dart';
import 'package:gronow/screens/explore_screen.dart';
import 'package:gronow/screens/home/home_screen.dart';
import 'package:gronow/screens/map/map.dart';

import '../favourite_screen.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Shop", "assets/icons/shop_icon.svg", 0, const HomeScreen()),
  NavigatorItem(
      "Explore", "assets/icons/explore_icon.svg", 1, const ExploreScreen()),
  NavigatorItem("Cart", "assets/icons/cart_icon.svg", 2, const CartScreen()),
  NavigatorItem("Map", "assets/icons/location_icon.svg", 3, const MapScreen()),
  // NavigatorItem(
  //     "Favourite", "assets/icons/favourite_icon.svg", 4, FavouriteScreen()),
  NavigatorItem(
      "Account", "assets/icons/account_icon.svg", 4, const AccountScreen()),
];
