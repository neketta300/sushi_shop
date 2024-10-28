import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sushi_shop/models/food.dart';
import 'package:sushi_shop/theme/colors.dart';

class FoodMenuTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodMenuTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: foodTileColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 25),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // image
                Image.asset(
                  food.image,
                  height: 140,
                ),

                // text
                Text(
                  food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                ),

                // price + rating
                SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      Text(
                        '\$${food.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),

                      // rating
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                          ),
                          Text(
                            food.rating,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopularFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const PopularFoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      constraints: const BoxConstraints(minWidth: 335),
      decoration: BoxDecoration(
        color: foodTileColor /*Colors.grey[100]*/,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 25, bottom: 25),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          onLongPress: () async {
            showMenu(
              menuPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              color: const Color.fromARGB(255, 108, 48, 60),
              context: context,
              position: RelativeRect.fromLTRB(
                (screenWidth / 10) * 8,
                (screenHeight / 10) * 8.7,
                (screenWidth / 10) * 2,
                (screenHeight / 10) * 1.3,
              ),
              items: [
                const PopupMenuItem<String>(
                  value: 'share',
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Share',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ).then((value) async {
              if (value == 'share') {
                await Share.share(
                  'Checkout best sushi by Romchik',
                );
              }
            });
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // image
                Row(
                  children: [
                    Image.asset(
                      food.image,
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
                          food.name,
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // price
                        Text(
                          '\$' + food.price,
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
          ),
        ),
      ),
    );
  }
}
