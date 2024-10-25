import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
