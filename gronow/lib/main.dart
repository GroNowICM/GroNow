import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gronow/database.dart';
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
  Future<void> insertUser(User user) async {
    // Get a reference to the database.
    final db = await database;

    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCourier(Courier courier) async {
    // Get a reference to the database.
    final db = await database;

    await db.insert(
      'courier',
      courier.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertPackage(Package package) async {
    // Get a reference to the database.
    final db = await database;

    await db.insert(
      'package',
      package.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCart(Cart cart) async {
    // Get a reference to the database.
    final db = await database;

    await db.insert(
      'cart',
      cart.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the users from the users table.
  Future<List<User>> user() async {
    // Get a reference to the database.
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return User(
          id: maps[i]['id'],
          name: maps[i]['name'],
          username: maps[i]['username'],
          email: maps[i]['email']);
    });
  }

  Future<List<Courier>> courier() async {
    // Get a reference to the database.
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('courier');

    return List.generate(maps.length, (i) {
      return Courier(
          id: maps[i]['id'],
          name: maps[i]['name'],
          username: maps[i]['username'],
          email: maps[i]['email'],
          plate: maps[i]['plate']);
    });
  }

  Future<List<Cart>> cart() async {
    // Get a reference to the database.
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('cart');

    return List.generate(maps.length, (i) {
      return Cart(
        cartid: maps[i]['id'],
        userid: maps[i]['userid'],
        items: maps[i]['items'],
      );
    });
  }

  Future<List<Package>> package() async {
    // Get a reference to the database.
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('package');

    return List.generate(maps.length, (i) {
      return Package(
        id: maps[i]['id'],
        userid: maps[i]['userid'],
        courierid: maps[i]['courier'],
        items: maps[i]['items'],
      );
    });
  }

  Future<void> updateUser(User user) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'user',
      user.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [user.id],
    );
  }

  Future<void> updateCourier(Courier courier) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'courier',
      courier.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [courier.id],
    );
  }

  Future<void> updateCart(Cart cart) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'cart',
      cart.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'cartid = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [cart.cartid],
    );
  }

  Future<void> updatePackage(Package package) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'package',
      package.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [package.id],
    );
  }

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


  

  runApp(const MyApp());
}
