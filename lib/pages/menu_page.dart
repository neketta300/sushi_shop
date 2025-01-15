import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/components/primaty_button.dart';
import 'package:sushi_shop/components/food_tile.dart';
import 'package:sushi_shop/models/food.dart';
import 'package:sushi_shop/models/shop.dart';
import 'package:sushi_shop/pages/food_details_page.dart';
import 'package:sushi_shop/theme/colors.dart';

enum TypeMenu { foundFood, foodMenu, popularFood, promoFood }

class MenuPageWidget extends StatefulWidget {
  const MenuPageWidget({super.key});

  @override
  State<MenuPageWidget> createState() => _MenuPageWidgetState();
}

class _MenuPageWidgetState extends State<MenuPageWidget> {
  @override
  initState() {
    final shop = context.read<Shop>();
    shop.foundFood = shop.foodMenu;
    super.initState();
  }

  void _runFilter(BuildContext context, String foodName) {
    final shop = context.read<Shop>();

    List<Food> serchResult = [];
    if (foodName.isEmpty) {
      serchResult = shop.foodMenu;
    } else {
      serchResult = shop.foodMenu
          .where((food) =>
              food.name.toLowerCase().contains(foodName.toLowerCase()))
          .toList();
    }
    setState(() {
      shop.foundFood = serchResult;
    });
  }

  // navigate to food item details page
  void navigateToFoodDetails(int index, TypeMenu menu) {
    //get the shop and its menu
    final shop = context.read<Shop>();
    if (menu == TypeMenu.foodMenu) {
      final foodMenu = shop.foodMenu;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetailsPage(
            food: foodMenu[index],
          ),
        ),
      );
    } else if (menu == TypeMenu.popularFood) {
      final popularFoodMenu = shop.popularFoodMenu;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetailsPage(
            food: popularFoodMenu[index],
          ),
        ),
      );
    } else if (menu == TypeMenu.promoFood) {
      final promoFood = shop.promoFood;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetailsPage(
            food: promoFood,
          ),
        ),
      );
    } else if (menu == TypeMenu.foundFood) {
      final foundFood = shop.foundFood;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetailsPage(
            food: foundFood[index],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //get the shop and its menu
    final shop = context.read<Shop>();
    final foundFood = shop.foundFood;
    //final foodMenu = shop.foodMenu;
    final popularFood = shop.popularFoodMenu;
    final promoFood = shop.promoFood;
    return Scaffold(
      backgroundColor: backGroungColor /*Colors.grey[300]*/,
      appBar: AppBar(
        foregroundColor: Colors.grey[900],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Room',
        ),
        actions: [
          // cart buttonx
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      // promo message
                      'Get 32% promo',
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // redeem button
                    MyPrimaryButton(
                      text: 'Reddem',
                      onTap: () => navigateToFoodDetails(0, TypeMenu.promoFood),
                    ),
                  ],
                ),
                Image.asset(
                  promoFood.image,
                  height: 100,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          // serch bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              //cursorColor: Colors.white,
              onChanged: (value) => _runFilter(context, value),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here..",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Food menu',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          SizedBox(
            width: 500,
            height: 300,
            child: Expanded(
              child: ListView.builder(
                itemExtent: 180,
                scrollDirection: Axis.horizontal,
                itemCount: foundFood.length,
                itemBuilder: (context, index) => FoodMenuTile(
                  food: foundFood[index],
                  onTap: () => navigateToFoodDetails(index, TypeMenu.foundFood),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // popular food

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Popular food',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 140,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: popularFood.map(
                  (food) {
                    return PopularFoodTile(
                      food: food,
                      onTap: () => navigateToFoodDetails(
                          popularFood.indexOf(food), TypeMenu.popularFood),
                    );
                  },
                ).toList(),
              ),
            ),
          )

          // Container(
          //   decoration: BoxDecoration(
          //     color: foodTileColor /*Colors.grey[100]*/,
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          //   padding: const EdgeInsets.all(20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       // image
          //       Row(
          //         children: [
          //           Image.asset(
          //             Images.maki,
          //             height: 60,
          //           ),
          //           const SizedBox(
          //             width: 20,
          //           ),
          //           // name and price
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               // name
          //               Text(
          //                 "Maki",
          //                 style: GoogleFonts.dmSerifDisplay(fontSize: 18),
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               // price
          //               Text(
          //                 '\$23.00',
          //                 style: TextStyle(
          //                   color: Colors.grey[700],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //       const Icon(
          //         Icons.favorite_outline,
          //         color: Colors.grey,
          //         size: 28,
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
