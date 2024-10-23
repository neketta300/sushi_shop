import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/components/primaty_button.dart';
import 'package:sushi_shop/components/food_tile.dart';
import 'package:sushi_shop/models/shop.dart';
import 'package:sushi_shop/pages/food_details_page.dart';
import 'package:sushi_shop/resources/resources.dart';
import 'package:sushi_shop/theme/colors.dart';

class MenuPageWidget extends StatefulWidget {
  const MenuPageWidget({super.key});

  @override
  State<MenuPageWidget> createState() => _MenuPageWidgetState();
}

class _MenuPageWidgetState extends State<MenuPageWidget> {
  // navigate to food item details page
  void navigateToFoodDetails(int index) {
    //get the shop and its menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetailsPage(
            food: foodMenu[index],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    //get the shop and its menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: backGroungColor /*Colors.grey[300]*/,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Room',
          style: TextStyle(
            color: Colors.grey[900],
          ),
        ),
        actions: [
          // cart button
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  MyPrimaryButton(text: 'Reddem', onTap: () {}),
                ],
              ),
              Image.asset(
                Images.threePhiladelphmeiSushi,
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

        // meenu list
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

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,
            itemBuilder: (context, index) => FoodMenuTile(
              food: foodMenu[index],
              onTap: () => navigateToFoodDetails(index),
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

        Container(
          decoration: BoxDecoration(
            color: foodTileColor /*Colors.grey[100]*/,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // image
              Row(
                children: [
                  Image.asset(
                    Images.maki,
                    height: 60,
                  ),

                  const SizedBox(
                    width: 20,
                  ),
                  // name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // name
                      Text(
                        "Maki",
                        style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // price
                      Text(
                        '\$23.00',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.favorite_outline,
                color: Colors.grey,
                size: 28,
              )
            ],
          ),
        )
      ]),
    );
  }
}
