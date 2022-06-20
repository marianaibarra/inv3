import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/input_file_widget.dart';
import 'inventory_page.dart';

class NewRegisterPage extends StatelessWidget {
  String register;

  NewRegisterPage(this.register );

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
        title: Text("New $register"),
        backgroundColor: primaryColor,
      ),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          children: [  
          const SizedBox(height: 20,),
          inputFileWithIcon(label:"Date", icon: const Icon(Icons.calendar_today_outlined)),
          const SizedBox(height: 20,),
          MaterialButton(
            minWidth: double.infinity,
            height: 40,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InventoryPage()));
            },
            color: primaryColor,
            child: const Text(
              "Select product",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20,),
          inputFile(label: "\$ 0", typeKeyboard: TextInputType.number),
          const SizedBox(height: 20,),
          inputFile(label: "Quantity", typeKeyboard: TextInputType.number),
          const SizedBox(height: 20,),
          MaterialButton(
            minWidth: double.infinity,
            height: 40,
            onPressed: () {},
            color: register == "Sell" ? actionColor : removeActionColor,
            child: Text(
              "Create $register",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}