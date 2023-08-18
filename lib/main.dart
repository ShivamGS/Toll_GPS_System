import 'package:flutter/material.dart';
import 'package:shivam_app/map/map_layout.dart';
import 'package:shivam_app/widgets/Login_page.dart';
import 'package:shivam_app/widgets/admin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthScreen());
  }
}
