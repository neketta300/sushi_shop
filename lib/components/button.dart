import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 108, 48, 60),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // text
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(
                width: 10,
              ),

              //icon
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
