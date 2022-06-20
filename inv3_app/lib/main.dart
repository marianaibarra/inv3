import 'package:flutter/material.dart';

import 'constants.dart';
import 'features/registration/presentation/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      // color: primaryColor,
      title: "Inv3",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: "LobsterTwo",
        scaffoldBackgroundColor: Colors.white
      ),
      home: const HomePage(),
    )
  );
}