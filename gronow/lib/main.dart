import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gronow/database_helper.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:gronow/styles/colors.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'app.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  const String dbcreator =
      "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, username TEXT, email TEXT); GO;"
      "CREATE TABLE courier(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,username TEXT, email TEXT, plate TEXT);GO;"
      "CREATE TABLE package(id INTEGER PRIMARY KEY AUTOINCREMENT, userid INTEGER, courierid INTEGER, items BLOB, FOREIGN KEY (userid) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION, FOREIGN KEY (courierid) REFERENCES courier(id) ON DELETE NO ACTION ON UPDATE NO ACTION);GO;"
      "CREATE TABLE cart(id INTEGER PRIMARY KEY AUTOINCREMENT, userid INTEGER, FOREIGN KEY (userid) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION, items BLOB);GO;";
  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) {
      return db.execute(dbcreator);
    },
    version: 1,
  );

  // A method that retrieves all the users from the users table.

  Future<void> deleteUser(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'user',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> deleteCourier(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'courier',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> deleteCart(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'cart',
      // Use a `where` clause to delete a specific dog.
      where: 'cartid = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> deletePackage(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'package',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: AppColors.primaryColor,
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);

  runApp(const MyApp());
}
