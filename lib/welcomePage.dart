import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shivam_app/map/map_layout.dart';
import 'package:shivam_app/widgets/Login_page.dart';
import 'package:shivam_app/pages/homie.dart';
import 'package:shivam_app/pages/razorPay.dart';
import 'package:shivam_app/pages/mapp.dart';
import 'package:shivam_app/pages/profile.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  int selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> _pages = [homie(), mapp(), razorPay(), profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: GNav(
        onTabChange: (index) {
          setState(() {
            selectedIndex = index;
            _navigateBottomBar(index);
          });
        },
        // backgroundColor: Colors.black,
        // color: Colors.white,
        activeColor: Colors.blueAccent[200],
        // tabBackgroundColor: Colors.white,
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home_filled,
            text: 'Home',
          ),
          GButton(
            icon: Icons.location_pin,
            text: 'Map',
          ),
          GButton(
            icon: Icons.paypal,
            text: 'RazorPay',
          ),
          GButton(
            icon: Icons.manage_accounts,
            text: 'Account',
          ),
        ],
        // selectedIndex: _selectedIndex,
        // onTabChange: (index) {
        //   setState(() {
        //     _selectedIndex = index;
        //   });
        // }
      ),
    );
  }
}
