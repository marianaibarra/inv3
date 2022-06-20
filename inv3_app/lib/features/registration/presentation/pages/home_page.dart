import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../widgets/google_sing_in_widget.dart';
import 'signin_page.dart';
import 'signup_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: size.height / 4.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Welcome to",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      )),
                  const Text("Inv3",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                          color: primaryColor)),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: <Widget>[
                      // Google button
                      const GoogleSignInBtn(),
                      // Sing in button
                      const SizedBox(
                        height: 5,
                      ),
                      // ignore: prefer_const_constructors
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 40,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()));
                        },
                        color: primaryColor,
                        child: const Text(
                          "Sign in",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Sign up button
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 40,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()));
                        },
                        color: primaryColor,
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}