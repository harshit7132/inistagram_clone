import 'package:flutter/material.dart';

class Upload_Page extends StatefulWidget {
  const Upload_Page({super.key});

  @override
  State<Upload_Page> createState() => _Upload_PageState();
}

class _Upload_PageState extends State<Upload_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('upload'),
      ),
    );
  }
}
