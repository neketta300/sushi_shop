import 'package:flutter/material.dart';
import 'package:sushi_shop/models/food.dart';
import 'package:sushi_shop/resources/resources.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: "21.00",
      image: Images.philadelphmeiSushi,
      rating: "4.9",
    ),
    Food(
      name: "Canviar Sushi",
      price: "49.00",
      image: Images.threeCaviarSushi,
      rating: "4.7",
    ),
  ];

  // customer cart
  List<Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food foodItem) {
    cart.remove(foodItem);
    notifyListeners();
  }
}
