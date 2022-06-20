import 'package:flutter/material.dart';

import '../../../../constants.dart';

Widget deliveryService({imageSrc, text}) {
  return Container(
    width: 120,
    decoration: const BoxDecoration(color: Color(0xFFE6E6E6)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Image.asset(
        imageSrc,
        width: 80.0,
      ),
      Container(
        alignment: Alignment.center,
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: text == "+" ? actionColor : removeActionColor,
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      ),
    ]),
  );
}