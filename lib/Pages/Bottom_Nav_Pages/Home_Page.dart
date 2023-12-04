import 'package:flutter/material.dart';

class Bottom_Home_Page extends StatefulWidget {
  const Bottom_Home_Page({super.key});

  @override
  State<Bottom_Home_Page> createState() => _Bottom_Home_PageState();
}

class _Bottom_Home_PageState extends State<Bottom_Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
