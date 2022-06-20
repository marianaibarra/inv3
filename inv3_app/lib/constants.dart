import 'package:flutter/material.dart';

const primaryColor = Color(0xFF525E75);
const removeActionColor = Color(0xFFFF8080);
const actionColor = Color(0xFF92BA92);
const iconItems = [
  BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined, color: Colors.white,), label: "Balance"),
  BottomNavigationBarItem(icon: Icon(Icons.inventory, color: Colors.white),label: "Inventory" ),
  BottomNavigationBarItem(icon: Icon(Icons.account_tree_rounded, color: Colors.white), label: "Integrations"),
  BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.white), label: "Profile"),
];