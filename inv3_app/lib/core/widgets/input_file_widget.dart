import 'package:flutter/material.dart';

import '../../constants.dart';

Widget inputFile(
    {label, obscureText = false, typeKeyboard = TextInputType.text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TextField(
        keyboardType: typeKeyboard,
        obscureText: obscureText,
        decoration: InputDecoration(
            label: Text(label),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor))),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}

Widget inputFileWithIcon({label, obscureText = false, typeKeyboard = TextInputType.text, icon = null}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TextField(
        keyboardType: typeKeyboard,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: icon,
          label: Text(label),
          contentPadding:
            const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor))),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}