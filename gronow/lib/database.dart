// Avoid errors caused by flutter upgrade.

class User {
  int? id;
  final String name;
  final String username;
  final String email;
  final String password;
  User(
      {required this.name,
      required this.username,
      required this.email,
      required this.password});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'password': password
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email: $email,password: $password}';
  }
}

class Courier {
  int? id;
  final String name;
  final String username;
  final String email;
  final String plate;
  final String password;

  Courier(
      {required this.name,
      required this.username,
      required this.password,
      required this.email,
      required this.plate});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'plate': plate,
      'password': password
    };
  }

  @override
  String toString() {
    return 'Courier{id: $id, name: $name, username: $username,password:$password, email :$email, email :$plate}';
  }
}

class Cart {
  int? cartid;
  final int userid;
  final List items;

  Cart({required this.userid, required this.items});
  Map<String, dynamic> toMap() {
    return {'id': cartid, 'userid': userid, 'items': items};
  }

  @override
  String toString() {
    return 'Cart{id: $cartid, userid: $userid, items: $items}';
  }
}

class Package {
  int? id;
  final int userid;
  final int courierid;
  final List items;

  Package({required this.userid, required this.courierid, required this.items});
  Map<String, dynamic> toMap() {
    return {'id': id, 'userid': userid, 'courierid': courierid, 'items': items};
  }

  @override
  String toString() {
    return 'Cart{id: $id, userid: $userid, courierid: $courierid, items: $items}';
  }
}
