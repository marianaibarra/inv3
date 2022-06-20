import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../widgets/inventory_card_widget.dart';
import 'new_register_page.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({Key? key}) : super(key: key);

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: getFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          "assets/images/logo.png",
        ),
        centerTitle: true,
        title: const Text("Balance"),
        backgroundColor: primaryColor,
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: getBody(),
    );
  }

  Widget getFab() {
    return Stack(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(bottom: 50.0, top: 50.0),
            child: FloatingActionButton.extended(
              heroTag: "newsell",
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewRegisterPage("Expense")));
              },
              backgroundColor: removeActionColor,
              label: const Text(
                "New expense",
                style: TextStyle(color: Colors.white),
              ),
            )),
        FloatingActionButton.extended(
          heroTag: "newexpense",
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewRegisterPage("Sell")));
          },
          backgroundColor: actionColor,
          label: const Text(
            "New sell",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    int totalFounds = 2000;
    return SingleChildScrollView(
      child: Column(
        children: [
          CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.parse("1990-12-12"),
              lastDate: DateTime.parse("2050-12-12"),
              onDateChanged: (DateTime date) {}),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xFFE6E6E6)),
                height: double.infinity,
                child: Column(
                  children: [
                    const Text("Total founds"),
                    Text("\$ $totalFounds"),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Color(0xFFE6E6E6)),
                height: double.infinity,
                child: Column(
                  children: [
                        
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: <Widget>[
              inventoryCard(name: "Expense", price: "2000"),
              inventoryCard(name: "Sell", price: "2000"),
              inventoryCard(name: "Expense", price: "2000"),
              inventoryCard(name: "Sell", price: "2000"),
              inventoryCard(name: "Expense", price: "2000"),
              inventoryCard(name: "Sell", price: "2000"),
              inventoryCard(name: "Expense", price: "2000"),
              inventoryCard(name: "Sell", price: "2000"),
            ]),
          ),
        ],
      ),
    );
  }
}
