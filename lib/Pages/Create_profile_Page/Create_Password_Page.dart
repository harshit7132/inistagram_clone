import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inistagram_clone/Bloc/SignIN_bloc/sign_in_bloc.dart';
import 'package:inistagram_clone/Custom_widgets/uihelper.dart';
import 'package:inistagram_clone/Pages/Create_profile_Page/birthday_page.dart';

import '../../Models/userModel.dart';

class Create_pass_Page extends StatefulWidget {
  String uid;
  String userName;
  String fullName;
  Create_pass_Page(
      {super.key,
      required this.fullName,
      required this.userName,
      required this.uid});

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
            Custom.textField(passwordController, 'Password', 'UserNamePage',
                (value) {
              FirebaseFirestore.instance
                  .collection("Users")
                  .doc(widget.uid)
                  .set(UserModel(
                    username: widget.userName,
                    email: '',
                    dob: '',
                    password: passwordController.text.trim(),
                    mobile: '',
                    id: widget.uid,
                    fullName: widget.fullName,
                  ).toMap())
                  .then((value) {
                log("User Created!!");
                Custom.CustomSnackBar("Welcome ${widget.fullName}", context);
              });
              context.read<SignInBloc>().add(passwordEvent(value));
            }),
            SizedBox(height: 25.h),
            Custom.elevatedButton(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Birthday_page(
                            uid: widget.uid,
                            fullName: widget.fullName,
                            userName: widget.userName,
                            passWord: passwordController.text.trim(),
                          )));
            }, 'Next'),
          ],
        ),
      ),
    )));
  }
}
