import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Custom_widgets/Text_field.dart';

class Forgot_Page extends StatefulWidget {
  const Forgot_Page({super.key});

  @override
  State<Forgot_Page> createState() => _Forgot_PageState();
}

class _Forgot_PageState extends State<Forgot_Page> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.black,
            Colors.blue.shade600,
          ])),
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
            Text('Find your account',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: Colors.white)),
            SizedBox(height: 25.h),
            Text('Enter your username, email or mobile number',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.white)),
            SizedBox(height: 25.h),
            TextButton(
                onPressed: () {},
                child: Text('Can`t reset your password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ))),
            SizedBox(height: 25.h),
            Custom.textField(emailController, 'Username, email or mobile',
                'Forgot_password'),
            SizedBox(height: 25.h),
            Custom.elevatedButton(() {}, 'Find Account'),
            SizedBox(height: 25.h),
            Container(
              height: 40.h,
              width: 300.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Forgot_Page()));
                },
                child: Text('Log In With Facebook',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    )));
  }
}
