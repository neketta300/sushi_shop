import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/components/primaty_button.dart';
import 'package:sushi_shop/models/food.dart';
import 'package:sushi_shop/models/shop.dart';
import 'package:sushi_shop/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  // remove from cart
  void removeFromCart(Food food, BuildContext context) {
    // get access to shop
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text("My Cart"),
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: Column(
          children: [
            // CUSTOMER CART

            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from cart
                  final Food food = value.cart[index];
                  // get food name
                  final String foodName = food.name;
                  // get food price
                  final String foodPrice = food.price;
                  // return list title
                  return Container(
                    decoration: BoxDecoration(
                      color: secondryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(food, context),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // PAY BUTTON
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyPrimaryButton(text: "Pay now", onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
