import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/input_file_widget.dart';
import '../../../inventory/presentation/pages/inventory_page.dart';

class CreateCustomizedOrderPage extends StatelessWidget {
  const CreateCustomizedOrderPage({Key? key}) : super(key: key);

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
        title: const Text("New order"),
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
          inputFile(label: "client name"),
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
          inputFile(label: "client address"),
          const SizedBox(height: 20,),
          inputFile(label: "client phone", typeKeyboard: TextInputType.number),
          const SizedBox(height: 20,),
          inputFileWithIcon(label: "delivery date", typeKeyboard: TextInputType.datetime, icon: const Icon(Icons.calendar_today_outlined)),
          const SizedBox(height: 20,),
          MaterialButton(
            minWidth: double.infinity,
            height: 40,
            onPressed: () {},
            color: actionColor,
            child: const Text(
              "Create order",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
