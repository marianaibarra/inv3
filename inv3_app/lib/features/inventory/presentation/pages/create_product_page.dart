import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/input_file_widget.dart';

class CreateProductPage extends StatelessWidget {
  const CreateProductPage({Key? key}) : super(key: key);

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
        title: const Text("New product"),
        backgroundColor: primaryColor,
      ),
      body: getBody(context),
    );
  }

  Widget getBody(context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          children: [  
          const SizedBox(height: 20,),
          inputFile(label: "name"),
          const SizedBox(height: 20,),
          MaterialButton(
            minWidth: double.infinity,
            height: 40,
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => InventoryPage()));
            },
            color: primaryColor,
            child: const Text(
              "Select image",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20,),
          inputFile(label: "category"),
          const SizedBox(height: 20,),
          inputFile(label: "price", typeKeyboard: TextInputType.number),
          const SizedBox(height: 20,),
          inputFile(label: "unitary cost", typeKeyboard: TextInputType.number),
          const SizedBox(height: 20,),
          inputFile(label: "quantity", typeKeyboard: TextInputType.number),
          MaterialButton(
            minWidth: double.infinity,
            height: 40,
            onPressed: () {},
            color: actionColor,
            child: const Text(
              "Create product",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}