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

  get getName => name;

  get getUsername => username;

  get getEmail => email;

  get getPassword => password;
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'password': password
    };
  }

  static User fromMap(Map<String, Object?> map) {
    var tname = map['name'];
    var tusername = map['username'];
    var temail = map['email'];
    var tpassword = map['password'];
    return User(
        name: tname.toString(),
        username: tusername.toString(),
        email: temail.toString(),
        password: tpassword.toString());
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
    return 'Cart{id: $cartid, userid: $userid, items: ${itemsToString()}}';
  }

  String itemsToString() {
    var itemsStr = "[";
    for (var i = 0; i < items.length; i++) {
      if (i < items.length - 1) {
        itemsStr += '"${items[i]}",';
      } else {
        itemsStr += '"${items[i]}"';
      }
    }

    return itemsStr + "]";
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
