// ignore_for_file: must_be_immutable, camel_case_types

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inistagram_clone/Custom_widgets/uihelper.dart';

import '../../Authentication/Email_auth/SignUp_page.dart';
import '../../Models/userModel.dart';

class Birthday_page extends StatefulWidget {
  String uid;
  String userName;
  String fullName;
  String passWord;
  Birthday_page(
      {super.key,
      required this.fullName,
      required this.userName,
      required this.uid,
      required this.passWord});

  @override
  State<Birthday_page> createState() => _Birthday_pageState();
}

class _Birthday_pageState extends State<Birthday_page> {
  DateTime date = DateTime(2016, 10, 26);

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.uid)
        .set(UserModel(
          username: widget.userName,
          email: '',
          dob: date.toString(),
          password: widget.passWord,
          mobile: '',
          id: widget.uid,
          fullName: widget.fullName,
        ).toMap())
        .then((value) {
      log("User Created!!");
      Custom.CustomSnackBar("Welcome ${widget.fullName}", context);
    });
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
              children: <Widget>[
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
                Text('What`s your date of birth?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        color: Colors.white)),
                SizedBox(height: 25.h),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          'Use your own date of birth, even if this account is for a business, a pet or something else. No one will see this unless you choose to share it.',
                      style: TextStyle(
                          height: 1.6,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: Colors.white)),
                  TextSpan(
                      text: 'Why do I need to provide my date of birth?',
                      style: TextStyle(
                          height: 1.6,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: Colors.blue))
                ])),
                SizedBox(height: 15.h),
                InkWell(
                    onTap: () {
                      _showDialog(
                        CupertinoDatePicker(
                          initialDateTime: date,
                          mode: CupertinoDatePickerMode.date,
                          use24hFormat: true,
                          showDayOfWeek: true,
                          onDateTimeChanged: (DateTime newDate) {
                            setState(() => date = newDate);
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 50.h,
                      width: 500.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: Colors.grey.shade600,
                      ),
                      child: Text(
                        '${date.month}-${date.day}-${date.year}',
                        style: GoogleFonts.abhayaLibre(
                            fontWeight: FontWeight.bold,
                            fontSize: 23.sp,
                            color: Colors.white),
                      ),
                    )),
                SizedBox(height: 25.h),
                Custom.elevatedButton(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUp_page(
                                password: widget.passWord,
                                userName: widget.userName,
                                fullName: widget.fullName,
                                uid: widget.uid,
                                DOB: date.toString(),
                              )));
                }, 'Next')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
