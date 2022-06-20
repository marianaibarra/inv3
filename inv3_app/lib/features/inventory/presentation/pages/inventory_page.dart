import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../widgets/product_card_widget.dart';
import 'create_product_page.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("New product"),
        heroTag: "newsell",
        elevation: 0,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateProductPage()));
        }
      ),
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          "assets/images/logo.png",
        ),
        centerTitle: true,
        title: const Text("Inventory"),
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
            const SizedBox(height: 20,),      
            const TextField(
            decoration: InputDecoration(
              fillColor: Color(0xFFE6E6E6),
                icon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                hintText: "\$ 0",
                labelText: "Value"),
          ),
          const SizedBox(height: 20,),
          productCard(title:"title", subtitle: "subtitle", imageSrc: "assets/images/empanada.jpg"),         
          productCard(title:"title", subtitle: "subtitle", imageSrc: "assets/images/empanada.jpg"),        
          productCard(title:"title", subtitle: "subtitle", imageSrc: "assets/images/empanada.jpg"),         
        ],
        ),
      ),
    );
  }
}

