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

  List<Food> _foundFood = [];

  final List<Food> _popularFoodMenu = [
    Food(
      name: "Maki",
      price: "23.00",
      image: Images.maki,
      rating: "5.0",
    ),
    Food(
      name: "Philadelphmei Sushi",
      price: "49.00",
      image: Images.threePhiladelphmeiSushi,
      rating: "4.7",
    ),
  ];

  final Food _promoFood = Food(
      name: 'Green Maki', price: '37.00', image: Images.twoMaki, rating: '4.1');
  // customer cart
  List<Food> _cart = [];

  //setter methods
  set foundFood(List<Food> value) {
    _foundFood = value;
  }

  //getter methods
  Food get promoFood => _promoFood;
  List<Food> get foundFood => _foundFood;
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
  List<Food> get popularFoodMenu => _popularFoodMenu;

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
