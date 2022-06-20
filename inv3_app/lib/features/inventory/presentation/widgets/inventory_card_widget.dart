import 'package:flutter/material.dart';

import '../../../../constants.dart';

Widget inventoryCard ({name, price}) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(name),
            leading: Icon(
              Icons.attach_money_rounded,
              color: name == "Expense" ? removeActionColor : actionColor,
            ),
            trailing: Text(
              '\$ ' + price,
              style: TextStyle(
                  color: name == "Expense" ? removeActionColor : actionColor),
            ),
          ),
        ],
      ),
    );
}
