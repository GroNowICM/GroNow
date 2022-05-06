class GroceryItem {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  GroceryItem(
      {required this.name,
      required this.description,
      required this.price,
      required this.imagePath});
}

var demoItems = [];

var exclusiveOffers = [
  GroceryItem(
      name: "Organic Bananas",
      description: "7pcs, Price/Kg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/lemon.png"),
  GroceryItem(
      name: "Red Apple",
      description: "1kg, Price/Kg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/apple.png"),
  GroceryItem(
      name: "Yellow Sugar",
      description: "1kg, Price/Kg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/yellow_sugar.png"),
];

var bestSelling = [
  GroceryItem(
      name: "Bell Pepper Red",
      description: "1kg, Price/Kg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/pepper.png"),
  GroceryItem(
      name: "Ginger",
      description: "250gm, Price/Kg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/ginger.png"),
  GroceryItem(
      name: "Grapes",
      description: "1kg, Price/Kg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/grapes.png"),
];

var meats = [
  GroceryItem(
      name: "Beef",
      description: "250gm, Price/Kg",
      price: 3.99,
      imagePath: "assets/images/grocery_images/beef.png"),
  GroceryItem(
      name: "Chicken",
      description: "1kg, Price/Kg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/chicken.png"),
  GroceryItem(
      name: "Cow Meat",
      description: "150gm, Price/Kg",
      price: 6.99,
      imagePath: "assets/images/grocery_images/cow.png"),
  GroceryItem(
      name: "Goat Meat",
      description: "350gm, Price/Kg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/goat.png"),
];

var beverages = [
  GroceryItem(
      name: "Diet Coke",
      description: "355ml, Price",
      price: 1.99,
      imagePath: "assets/images/beverages_images/diet_coke.png"),
  GroceryItem(
      name: "Sprite Can",
      description: "325ml, Price",
      price: 1.50,
      imagePath: "assets/images/beverages_images/sprite.png"),
  GroceryItem(
      name: "Apple Juice",
      description: "2L, Price",
      price: 1.20,
      imagePath: "assets/images/beverages_images/apple_and_grape_juice.png"),
  GroceryItem(
      name: "Orange Juice",
      description: "2L, Price",
      price: 1.17,
      imagePath: "assets/images/beverages_images/orange_juice.png"),
  GroceryItem(
      name: "Coca Cola Can",
      description: "325ml, Price",
      price: 2.49,
      imagePath: "assets/images/beverages_images/coca_cola.png"),
  GroceryItem(
      name: "Pepsi Can",
      description: "330ml, Price",
      price: 2.30,
      imagePath: "assets/images/beverages_images/pepsi.png"),
];

var legumes = [
  GroceryItem(
      name: "Kidney Beans",
      description: "1Kg, Price/Kg",
      price: 1.29,
      imagePath: "assets/images/grocery_images/beans.png"),
  GroceryItem(
      name: "Black Beans",
      description: "1Kg, Price/Kg",
      price: 1.99,
      imagePath: "assets/images/grocery_images/black_beans.png"),
  GroceryItem(
      name: "Green Beans",
      description: "1Kg, Price/Kg",
      price: 0.99,
      imagePath: "assets/images/grocery_images/green_beans.png"),
  GroceryItem(
      name: "Lentils",
      description: "1Kg, Price/Kg",
      price: 2.49,
      imagePath: "assets/images/grocery_images/lentils.png"),
];

var cart = <GroceryItem>[];
