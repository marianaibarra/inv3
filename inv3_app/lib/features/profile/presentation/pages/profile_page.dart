import 'package:flutter/material.dart';
import 'package:inv3_app/features/registration/presentation/pages/create_bussiness_page.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/input_file_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          "assets/images/logo.png",
        ),
        centerTitle: true,
        title: const Text("Profile"),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
          children: [
            const SizedBox(height: 20.0,),
            inputFileWithIcon(label: "name of user", icon: const Icon(Icons.person)),
            const SizedBox(height: 20.0,),
            MaterialButton(
              minWidth: double.infinity,
              height: 40,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateBussinessPage()));
              },
              color: primaryColor,
              child: const Text(
                "Add another bussiness",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              minWidth: double.infinity,
              height: 40,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => InventoryPage()));
              },
              color: primaryColor,
              child: const Text(
                "Edit profile",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20,),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                minWidth: double.infinity,
                height: 40,
                onPressed: () {
                  // Navigator.pop(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => CreateBussinessPage()));
                },
                color: removeActionColor,
                child: const Text(
                  "Log out",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        )),
        ), 
      ),
    );
  }
}