import 'package:flutter/material.dart';

class razorPay extends StatefulWidget {
  const razorPay({super.key});

  @override
  State<razorPay> createState() => _razorPayState();
}

class _razorPayState extends State<razorPay> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'RazorPay Karo',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
