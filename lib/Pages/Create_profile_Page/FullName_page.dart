import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inistagram_clone/Custom_widgets/uihelper.dart';
import 'package:uuid/uuid.dart';

import '../../Bloc/signIn_Bloc/sign_in_bloc.dart';
import '../../Models/userModel.dart';
import 'Create_userName_page.dart';

class Full_name_page extends StatefulWidget {
  const Full_name_page({super.key});

  @override
  State<Full_name_page> createState() => _Full_name_pageState();
}

class _Full_name_pageState extends State<Full_name_page> {
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
            Text('What`s your name?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: Colors.white)),
            SizedBox(height: 25.h),
            Custom.textField(userNameController, 'Full name', 'UserNamePage',
                (value) {
              context.read<SignInBloc>().add(fullEvent(value));
            }),
            SizedBox(height: 25.h),
            Custom.elevatedButton(() {
              String uid = Uuid().v4();
              String fullName = userNameController.text.trim();
              FirebaseFirestore.instance
                  .collection("Users")
                  .doc(uid)
                  .set(UserModel(
                    username: '',
                    dob: '',
                    email: '',
                    password: '',
                    mobile: '',
                    id: uid,
                    fullName: fullName,
                  ).toMap())
                  .then((value) {
                log("User Created!!");
                Custom.CustomSnackBar("Welcome $uid", context);
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          User_name_page(uid: uid, fullName: fullName)));
            }, 'Next')
          ],
        ),
      ),
    )));
  }
}
