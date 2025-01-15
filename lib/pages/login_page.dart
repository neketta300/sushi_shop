import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sushi_shop/components/login_button.dart';
import 'package:sushi_shop/components/my_textfield.dart';
import 'package:sushi_shop/helper/helper_function.dart';
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
  final TextEditingController emailController =
      TextEditingController(text: 'trihana@gmail.com');

  final TextEditingController passwordController =
      TextEditingController(text: '123456');

  void login() async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      ),
    );

    // try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // pop loading circle
      if (context.mounted) Navigator.pop(context);

      // navigate to home page only if login is successful
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MenuPageWidget()),
      );
    } on FirebaseException catch (e) {
      // pop loading circle
      Navigator.pop(context);
      displayMessageToUser(
        e.code,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          // Center(
          //   child: Icon(
          //     Icons.lock_open_rounded,
          //     size: 100,
          //     color: Colors.grey[200],
          //   ),
          // ),

          Lottie.asset('lib/assets/pal.json', height: 300),

          const SizedBox(
            height: 25,
          ),

          // msg, app slogan
          Text(
            "At Romchick's Sushi Bar",
            style: GoogleFonts.dmSerifDisplay(
                fontSize: 20, color: const Color(0xFFEEEEEE)),
          ),

          const SizedBox(
            height: 25,
          ),
          // email textfield
          MyLogRegTextfield(
            controller: emailController,
            hintText: "Email",
            obscurreText: false,
          ),

          const SizedBox(
            height: 10,
          ),
          // password textfield
          MyLogRegTextfield(
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
