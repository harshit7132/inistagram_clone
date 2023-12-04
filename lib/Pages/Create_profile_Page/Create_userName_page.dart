// ignore_for_file: must_be_immutable, camel_case_types

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inistagram_clone/Bloc/SignIN_bloc/sign_in_bloc.dart';
import 'package:inistagram_clone/Custom_widgets/uihelper.dart';
import 'package:inistagram_clone/Pages/Create_profile_Page/Create_Password_Page.dart';

import '../../Models/userModel.dart';

class User_name_page extends StatefulWidget {
  String uid;
  String fullName;
  User_name_page({super.key, required this.uid, required this.fullName});

  @override
  State<User_name_page> createState() => _User_name_pageState();
}

class _User_name_pageState extends State<User_name_page> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
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
            Text('Create your username',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: Colors.white)),
            SizedBox(height: 25.h),
            Custom.textField(userNameController, 'User name', 'UserNamePage',
                (value) {
              context.read<SignInBloc>().add(userNameEvent(value));
            }),
            SizedBox(height: 25.h),
            Custom.elevatedButton(() {
              FirebaseFirestore.instance
                  .collection("Users")
                  .doc(widget.uid)
                  .set(UserModel(
                    username: userNameController.text.trim(),
                    email: '',
                    password: '',
                    dob: '',
                    mobile: '',
                    id: widget.uid,
                    fullName: widget.fullName,
                  ).toMap())
                  .then((value) {
                log("User Created!!");
                Custom.CustomSnackBar("Welcome ${widget.fullName}", context);
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Create_pass_Page(
                            userName: userNameController.text.trim(),
                            fullName: widget.fullName,
                            uid: widget.uid,
                          )));
            }, 'Next')
          ],
        ),
      ),
    )));
  }
}
