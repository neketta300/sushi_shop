import 'package:flutter/material.dart';

class MyPrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 108, 48, 60),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ],
    );
  }
}
