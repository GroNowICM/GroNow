import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
// Avoid errors caused by flutter upgrade.

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  const User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'username': username, 'email': email};
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email :$email}';
  }
}

class Courier {
  final int id;
  final String name;
  final String username;
  final String email;
  final String plate;

  const Courier(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.plate});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'plate': plate
    };
  }

  @override
  String toString() {
    return 'Courier{id: $id, name: $name, username: $username, email :$email, email :$plate}';
  }
}

class Cart {
  final int cartid;
  final int userid;
  final List items;

  const Cart({required this.cartid, required this.userid, required this.items});
  Map<String, dynamic> toMap() {
    return {'id': cartid, 'userid': userid, 'items': items};
  }

  @override
  String toString() {
    return 'Cart{id: $cartid, userid: $userid, items: $items}';
  }
}

class Package {
  final int id;
  final int userid;
  final int courierid;
  final List items;

  const Package(
      {required this.id,
      required this.userid,
      required this.courierid,
      required this.items});
  Map<String, dynamic> toMap() {
    return {'id': id, 'userid': userid, 'courierid': courierid, 'items': items};
  }

  @override
  String toString() {
    return 'Cart{id: $id, userid: $userid, courierid: $courierid, items: $items}';
  }
}
