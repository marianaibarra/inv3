import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/input_file_widget.dart';
import '../../../inventory/presentation/pages/landing_page.dart';

class CreateBussinessPage extends StatelessWidget {
  const CreateBussinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 20.0,
          color: Colors.black,
        ),
      ),
      body: getBody(context),
    );
  }
}

Widget getBody(context) {
  Size size = MediaQuery.of(context).size;
  return SafeArea(
    child: Container(
      width: double.infinity,
      height: size.height,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height / 4.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"))),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Create your bussiness",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                  )),
              const SizedBox(
                height: 25,
              ),
              inputFile(label: "name"),
              MaterialButton(
                minWidth: double.infinity,
                height: 40,
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName("/root"));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LandingPage()));
                },
                color: primaryColor,
                child: const Text(
                  "Create bussiness",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


