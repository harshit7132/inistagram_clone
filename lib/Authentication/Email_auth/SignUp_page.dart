import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inistagram_clone/Authentication/phone_Auth/phone_Page.dart';
import 'package:inistagram_clone/Bloc/SignIN_bloc/sign_in_bloc.dart';
import 'package:inistagram_clone/Bloc/bloc_Controllers/signIn_Controller.dart';
import 'package:inistagram_clone/Custom_widgets/uihelper.dart';

import '../../Models/userModel.dart';

class SignUp_page extends StatefulWidget {
  String uid;
  String userName;
  String fullName;
  String DOB;
  String password;
  SignUp_page(
      {super.key,
      required this.fullName,
      required this.userName,
      required this.uid,
      required this.DOB,
      required this.password});

  @override
  State<SignUp_page> createState() => _SignUp_pageState();
}

class _SignUp_pageState extends State<SignUp_page> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

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
            Text('What`s your email address?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27.sp,
                    color: Colors.white)),
            SizedBox(height: 18.h),
            Text(
                'Enter the email address at which you can be contacted. No one will see this on your profile',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.white)),
            SizedBox(height: 25.h),
            Custom.textField(emailController, 'Email address', 'UserNamePage',
                (value) {
              context.read<SignInBloc>().add(EmailEvent(value));
            }),
            SizedBox(height: 25.h),
            Custom.elevatedButton(() {
              FirebaseFirestore.instance
                  .collection("Users")
                  .doc(widget.uid)
                  .set(UserModel(
                    dob: widget.DOB,
                    username: widget.userName,
                    email: emailController.text.trim(),
                    password: widget.password,
                    mobile: '',
                    id: widget.uid,
                    fullName: widget.fullName,
                  ).toMap())
                  .then((value) {
                log("User Created!!");
                Custom.CustomSnackBar("Welcome ${widget.fullName}", context);
              });
              SignUpController(context: context).signUp();
            }, 'Next'),
            SizedBox(height: 25.h),
            Container(
              height: 40.h,
              width: 300.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignInWithPhoneScreen()));
                },
                child: Text('Sign up with Mobile Number',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    )));
  }
}
