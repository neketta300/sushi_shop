// display error msg
import 'package:flutter/material.dart';
import 'package:sushi_shop/theme/colors.dart';

void displayMessageToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: primaryColor,
      title: Text(
        'Error: ' + message,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
