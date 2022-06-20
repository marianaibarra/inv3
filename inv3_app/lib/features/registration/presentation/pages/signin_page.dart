
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/input_file_widget.dart';
import '../../../inventory/presentation/pages/landing_page.dart';
import 'signup_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 20.0,
          color: Colors.black,
        ),
      ),
      body: getBody(context),
    );
  }
}

Widget getBody(context) {
  Size size = MediaQuery.of(context).size;
  return SafeArea(
    child: Container(
      width: double.infinity,
      height: size.height,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: size.height / 6,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"))),
          ),
          const Text("Welcome back",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 64.0,
              )),
          const Text("Sign in to continue",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 12.0,
                  color: Colors.grey)),
          inputFile(label:"username"),
          inputFile(label:"password", obscureText: true,),
          const Text("Forgot password?",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 12.0,
                  color: Colors.black)),
          MaterialButton(
            minWidth: double.infinity,
            height: 40,
            onPressed: () {
              Navigator.of(context)
                  .popUntil(ModalRoute.withName("/root"));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LandingPage()));
            },
            color: primaryColor,
            child: const Text(
              "Sign in",
              style: TextStyle(color: Colors.white),
            ),
          ),
          InkWell(
            child: const Text("New user? Sign up",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12.0,
                    color: Colors.grey)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignUpPage()));
            },
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      )
    )
  );
}
