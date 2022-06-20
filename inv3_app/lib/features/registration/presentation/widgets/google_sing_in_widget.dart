import 'package:flutter/material.dart';

class GoogleSignInBtn extends StatelessWidget {
  const GoogleSignInBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Image(
              image:
                  AssetImage("assets/images/googlelogo.png"),
              height: 35.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Sign in with Google",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontFamily: "Product Sans")),
            )
          ],
        ),
      ),
    );
  }
}
