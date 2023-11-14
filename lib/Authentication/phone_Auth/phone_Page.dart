// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Custom_widgets/UiHelper.dart';
import 'otp_Page.dart';

class SignInWithPhoneScreen extends StatelessWidget {
  SignInWithPhoneScreen({super.key});
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ///___ Send otp
    void sendOTP() async {
      String phone = "+91" + phoneController.text.trim();
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (verificationId, resendToken) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => VerifyOtpScreen(
                        verificationId: verificationId,
                        phoneNumber: int.parse(phone.toString()),
                      )));
        },
        verificationCompleted: (credential) {},
        verificationFailed: (ex) {
          log(ex.code.toString());
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: const Duration(seconds: 30),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sign In With Phone',
                style: GoogleFonts.abhayaLibre(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600),
              ),
              SizedBox(
                height: 130.h,
              ),
              Text(
                'Enter mobile number and Login',
                style: GoogleFonts.abhayaLibre(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Custom.TextFieldWidget("Enter your number",
                  FontAwesomeIcons.mobile, phoneController),
              SizedBox(
                height: 40.h,
              ),
              Custom.ReusableContainer("Submit", Colors.black, () {
                sendOTP();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
