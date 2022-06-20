import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../widgets/order_card_widget.dart';

class ManageOrdersPage extends StatefulWidget {
  const ManageOrdersPage({Key? key}) : super(key: key);

  @override
  State<ManageOrdersPage> createState() => _ManageOrdersPageState();
}

class _ManageOrdersPageState extends State<ManageOrdersPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 20.0,
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text("Manage orders"),
        backgroundColor: primaryColor,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          children: <Widget>[
            orderCard(name:"product", status: "payed", address: "cra 34"),
            orderCard(name: "product",status: "on route", address: "cra 34"),
            orderCard(name: "product",status: "pending",address: "cra 34"),
          ],
        )
      ),
    );
  }
}

