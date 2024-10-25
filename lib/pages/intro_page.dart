import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_shop/components/primaty_button.dart';
import 'package:sushi_shop/resources/resources.dart';
import 'package:sushi_shop/theme/colors.dart';

class IntroPageWidget extends StatelessWidget {
  const IntroPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),

            // shop name
            Text(
              "AT ROMCHIK'S",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(Images.caviarSushi),
            ),
            // title
            Text(
              "DELICIOUS SUSHI AND MORE",
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 40, color: Colors.white, height: 1.3),
            ),

            const SizedBox(
              height: 10,
            ),

            //subtitle

            Text(
              "Try the most popular dishes from 'At Romchik's', cooked with love in the best kazarma. Natural ingredients only! Maked by n3hcorp",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //button

            MyPrimaryButton(
              text: "Get started",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/loginorregistation',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
