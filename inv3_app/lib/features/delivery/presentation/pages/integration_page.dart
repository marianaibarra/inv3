import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../widgets/delivery_service_card_widget.dart';
import 'create_customized_order_page.dart';
import 'manage_orders_page.dart';

class IntegrationsPage extends StatelessWidget {
  const IntegrationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          "assets/images/logo.png",
        ),
        centerTitle: true,
        title: const Text("Integrations"),
        backgroundColor: primaryColor,
      ),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 40,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageOrdersPage()));
                },
                color: primaryColor,
                child: const Text(
                  "Manage orders",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 40,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateCustomizedOrderPage()));
                },
                color: primaryColor,
                child: const Text(
                  "Customized order",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Text("Count balance?",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16.0,
                        color: Colors.grey)),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SignUpPage()));
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 50.0),
                    child: Text("Yes",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16.0,
                        color: Colors.grey)),
                  ),
                ],
              ),
              const Divider(),
              const Text("Manage delivery services",
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
              const Divider(),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  deliveryService(imageSrc: "assets/images/rappi.png", text: "+"),
                  deliveryService(imageSrc: "assets/images/rappi.png", text: "-"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


