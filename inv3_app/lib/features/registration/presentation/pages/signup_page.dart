import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/input_file_widget.dart';
import 'create_bussiness_page.dart';
import 'signin_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
        body: getBody(context)
    );
  }
}

Widget getBody(context) {
  Size size = MediaQuery.of(context).size;
  return SafeArea(
    child: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Container(
            height: size.height / 6,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"))),
          ),
          inputFile(label: "Name",),
          inputFile(label: "Last Name"),
          inputFile(label: "Email", typeKeyboard: TextInputType.emailAddress),
          inputFile(label: "Phone", typeKeyboard: TextInputType.phone),
          inputFile(label: "Password", obscureText: true),
          MaterialButton(
            minWidth: double.infinity,
            height: 40,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateBussinessPage()));
            },
            color: primaryColor,
            child: const Text(
              "Sign up",
              style: TextStyle(color: Colors.white),
            ),
          ),
          InkWell(
            child: const Text("Already a user? Sign in",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12.0,
                color: Colors.grey)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInPage()));
            },
          ),
        const SizedBox(
            height: 10.0,
          )
        ],
      )
      ),
    )
  );
}