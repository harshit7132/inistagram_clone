import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inistagram_clone/Custom_widgets/Text_field.dart';

import 'Create_profile_Page/UserName_page.dart';
import 'Forgot_Page.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.blue.shade600,
                Colors.black,
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'English (IN)',
                style: TextStyle(color: Colors.white70),
              ),
              Container(
                height: 70.h,
                width: 70.w,
                child: Image.asset(
                  'assets/images/pngwing.com.png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Custom.textField(Emailcontroller, 'Username, email or mobile',
                      'Login_page'),
                  SizedBox(height: 15.h),
                  Custom.textField(
                      Passwordcontroller, 'Password', 'Login_page'),
                  SizedBox(height: 15.h),
                  Custom.elevatedButton(() {}, 'Log In'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Forgot_Page()));
                      },
                      child: Text(
                        'Forgotten Password?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ],
              ),
              Container(
                height: 40.h,
                width: 300.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20)),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Full_name_page()));
                  },
                  child: Text('Create new account',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
