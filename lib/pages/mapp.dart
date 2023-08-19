import 'package:flutter/material.dart';

class mapp extends StatefulWidget {
  const mapp({super.key});

  @override
  State<mapp> createState() => _mappState();
}

class _mappState extends State<mapp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Map Kaa Page',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
