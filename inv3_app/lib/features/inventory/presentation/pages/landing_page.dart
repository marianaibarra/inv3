import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../delivery/presentation/pages/integration_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import 'balance_page.dart';
import 'inventory_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getbottomBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        const BalancePage(),
        const InventoryPage(),
        IntegrationsPage(),
        const ProfilePage(),
      ],
    );
  }

  Widget getbottomBar() {
    return BottomNavigationBar(
      backgroundColor: primaryColor,
      currentIndex: pageIndex,
      type: BottomNavigationBarType.fixed,
      items: iconItems,
      selectedItemColor: Colors.black,
      onTap: (index) {
        setTabs(index);
      },
    );
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
