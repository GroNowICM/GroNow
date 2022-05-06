import 'dart:developer';

import 'package:gronow/database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// ignore: camel_case_types
class database_helper {
  // Make a singleton class
  static const String dbcreator =
      "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, username TEXT, email TEXT, password TEXT);GO;";
  static const String dbcreator2 =
      "CREATE TABLE courier(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,username TEXT, email TEXT, password TEXT, plate TEXT);GO;";
  static const String dbcreator3 =
      "CREATE TABLE package(id INTEGER PRIMARY KEY AUTOINCREMENT, userid INTEGER, courierid INTEGER, items BLOB, FOREIGN KEY (userid) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION, FOREIGN KEY (courierid) REFERENCES courier(id) ON DELETE NO ACTION ON UPDATE NO ACTION);GO;";
  static const String dbcreator4 =
      "CREATE TABLE cart(id INTEGER PRIMARY KEY AUTOINCREMENT, userid INTEGER, items BLOB, FOREIGN KEY (userid) REFERENCES users(id) ON DELETE NO ACTION ON UPDATE NO ACTION);GO;";
  // Make a singleton class
  database_helper._privateConstructor();
  static final database_helper instance = database_helper._privateConstructor();

  // Use a single reference to the db.
  static Database? _db;
  Future<Database?>? _database;

  // Use this getter to use the database.
  Future<Database?> get database async {
    if (_db != null) return _db;
    // Instantiate db the first time it is accessed
    _db = await _initDB();

    return _db;
  }

  // Init the database for the first time.
  _initDB() async {
    log("iniite");
    return await openDatabase(join(await getDatabasesPath(), 'database.db'),
        version: 1, onCreate: (db, version) {
      db.execute(dbcreator2);
      db.execute(dbcreator3);
      db.execute(dbcreator4);
      return db.execute(dbcreator);
    });
  }

  Future<void> insertUser(User user) async {
    // Get a reference to the database.
    Database? db = await instance.database;
    await db!.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCourier(Courier courier) async {
    // Get a reference to the database.
    Database? db = await instance.database;

    await db!.insert(
      'courier',
      courier.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertPackage(Package package) async {
    // Get a reference to the database.
    Database? db = await instance.database;

    await db!.insert(
      'package',
      package.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCart(Cart cart) async {
    // Get a reference to the database.
    Database? db = await instance.database;

    await db!.insert(
      'cart',
      cart.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the users from the users table.
  Future<List<User>> user() async {
    // Get a reference to the database.
    Database? db = await instance.database;

    final List<Map<String, dynamic>> maps = await db!.query('users');
    log(maps.toString());
    return List.generate(maps.length, (i) {
      return User(
          name: maps[i]['name'],
          username: maps[i]['username'],
          email: maps[i]['email'],
          password: maps[i]['password']);
    });
  }

  Future<List<Courier>> courier() async {
    // Get a reference to the database.
    Database? db = await instance.database;

    final List<Map<String, dynamic>> maps = await db!.query('courier');
    log(maps.toString());
    return List.generate(maps.length, (i) {
      return Courier(
          name: maps[i]['name'],
          username: maps[i]['username'],
          password: maps[i]['password'],
          email: maps[i]['email'],
          plate: maps[i]['plate']);
    });
  }

  Future<List<Cart>> cart() async {
    // Get a reference to the database.
    Database? db = await instance.database;

    final List<Map<String, dynamic>> maps = await db!.query('cart');

    return List.generate(maps.length, (i) {
      return Cart(
        userid: maps[i]['userid'],
        items: maps[i]['items'],
      );
    });
  }

  Future<List<Package>> package() async {
    // Get a reference to the database.
    Database? db = await instance.database;

    final List<Map<String, dynamic>> maps = await db!.query('package');

    return List.generate(maps.length, (i) {
      return Package(
        userid: maps[i]['userid'],
        courierid: maps[i]['courier'],
        items: maps[i]['items'],
      );
    });
  }

  Future<void> updateUser(User user) async {
    // Get a reference to the database.
    Database? db = await instance.database;

    // Update the given Dog.
    await db!.update(
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
    Database? db = await instance.database;

    // Update the given Dog.
    await db!.update(
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
    Database? db = await instance.database;

    // Update the given Dog.
    await db!.update(
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
    Database? db = await instance.database;

    // Update the given Dog.
    await db!.update(
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
    Database? db = await instance.database;

    // Remove the Dog from the database.
    await db!.delete(
      'user',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> deleteCourier(int id) async {
    // Get a reference to the database.
    Database? db = await instance.database;

    // Remove the Dog from the database.
    await db!.delete(
      'courier',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> deleteCart(int id) async {
    // Get a reference to the database.
    Database? db = await instance.database;

    // Remove the Dog from the database.
    await db!.delete(
      'cart',
      // Use a `where` clause to delete a specific dog.
      where: 'cartid = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> deletePackage(int id) async {
    // Get a reference to the database.
    Database? db = await instance.database;

    // Remove the Dog from the database.
    await db!.delete(
      'package',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<User?> findUserByUserName(String username) async {
    Database? db = await instance.database;
    log("next" + username);
    log(db?.toString() as String);
    log("prev");
    List<Map<String, Object?>>? res = await db?.rawQuery(
        'SELECT name,username,email,password FROM users WHERE username=?',
        [username]);

    if (res?.isEmpty as bool) {
      return null;
    } else {
      return User.fromMap(res![0]);
    }
  }

  Future<int?> getIdfromUserName(String username) async {
    Database? db = await instance.database;

    List<Map<String, Object?>>? res = await db?.rawQuery(
        'SELECT id,username FROM users WHERE username=?', [username]);

    if (res?.isEmpty as bool) {
      return null;
    } else {
      return User.forId(res![0]);
    }
  }

  Future<Courier?> findCourierByUserName(String username) async {
    Database? db = await instance.database;
    List<Map<String, Object?>>? res = await db?.rawQuery(
        'SELECT name,username,email,password, plate FROM courier WHERE username=?',
        [username]);
    log(instance.courier().toString());
    log("soures" + res.toString() + "soures");
    return Courier.fromMap(res![0]);
  }
}
