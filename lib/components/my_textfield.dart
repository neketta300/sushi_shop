import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_shop/theme/colors.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscurreText;
  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscurreText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscurreText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 219, 219, 219)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 106, 106, 106)),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.dmSerifDisplay(
              color: Color.fromARGB(192, 186, 147, 156)),
        ),
      ),
    );
  }
}
