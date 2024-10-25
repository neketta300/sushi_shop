import 'package:flutter/material.dart';

class MyAlertButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyAlertButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 108, 48, 60),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // text
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // const SizedBox(
                //   width: 10,
                // ),

                // //icon
                // const Icon(
                //   Icons.arrow_forward,
                //   color: Colors.white,
                // )
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
        ))
      ],
    );
  }
}
