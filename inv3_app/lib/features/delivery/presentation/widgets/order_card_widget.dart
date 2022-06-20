import 'package:flutter/material.dart';

Widget orderCard ({name, status, address,}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(name),
          leading: Text(address),
          trailing: Text(status),
        ),
      ],
    ),
  );
}