import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Custom_widgets/Text_field.dart';

class Create_pass_Page extends StatefulWidget {
  const Create_pass_Page({super.key});

  @override
  State<Create_pass_Page> createState() => _Create_pass_PageState();
}

class _Create_pass_PageState extends State<Create_pass_Page> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, top: 25.h, right: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 35.sp,
                )),
            SizedBox(height: 25.h),
            Text('Create a password',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: Colors.white)),
            SizedBox(height: 25.h),
            Text(
                'Create a password with at least 6 letters or numbers. It should be something that others can`t guess.',
                style: TextStyle(
                    height: 1.6,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.white)),
            SizedBox(height: 25.h),
            Custom.textField(passwordController, 'Password', 'UserNamePage'),
            SizedBox(height: 25.h),
            Custom.elevatedButton(() {}, 'Next')
          ],
        ),
      ),
    )));
  }
}
