import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_shop/components/login_button.dart';
import 'package:sushi_shop/components/my_textfield.dart';
import 'package:sushi_shop/theme/colors.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cofnrimPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          Center(
            child: Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Colors.grey[200],
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // msg, app slogan
          Text(
            "Let's create an account for you",
            style: GoogleFonts.dmSerifDisplay(
                fontSize: 20, color: Colors.grey[200]),
          ),

          const SizedBox(
            height: 25,
          ),
          // email textfield
          MyTextfield(
            controller: emailController,
            hintText: "Email",
            obscurreText: false,
          ),

          const SizedBox(
            height: 10,
          ),
          // password textfield
          MyTextfield(
            controller: passwordController,
            hintText: "Password",
            obscurreText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          // password textfield
          MyTextfield(
            controller: cofnrimPasswordController,
            hintText: "Confrim password",
            obscurreText: true,
          ),

          const SizedBox(
            height: 10,
          ),
          // sign up button
          LoginButton(text: "Sign up", onTap: () {}),

          const SizedBox(
            height: 25,
          ),

          // already have an account? Login here

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: GoogleFonts.dmSerifDisplay(
                    color: const Color.fromARGB(255, 219, 219, 219)),
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Login here",
                  style: GoogleFonts.dmSerifDisplay(
                      color: const Color.fromARGB(255, 219, 219, 219),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
