import 'package:flutter/material.dart';

Widget productCard({title, subtitle, imageSrc}) {
  return Card(
    color: const Color(0xFFE6E6E6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Image.asset(imageSrc)
        ),
      ],
    ),
  );
}