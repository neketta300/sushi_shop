import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_shop/components/login_button.dart';
import 'package:sushi_shop/components/my_textfield.dart';
import 'package:sushi_shop/pages/menu_page.dart';
import 'package:sushi_shop/theme/colors.dart';

class LoginPage extends StatefulWidget {
  final void Function()? ontap;
  const LoginPage({super.key, this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() {
    /*





    */

    // navigate to home page
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MenuPageWidget()));
  }

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
            "At Romchick's Sushi Bar",
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
          // sign in button
          LoginButton(text: "Sign in", onTap: login),

          const SizedBox(
            height: 25,
          ),

          // not a member? register now

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member?",
                style: GoogleFonts.dmSerifDisplay(
                    color: const Color.fromARGB(255, 219, 219, 219)),
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: widget.ontap,
                child: Text(
                  "Register now",
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
