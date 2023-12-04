import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inistagram_clone/Custom_widgets/uihelper.dart';
import 'package:pinput/pinput.dart';

import '../../Pages/Home_Page.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String verificationId;
  final int phoneNumber;
  const VerifyOtpScreen(
      {super.key, required this.verificationId, required this.phoneNumber});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  TextEditingController otpController = TextEditingController();

  ///verify otp ---
  void verifyOTP() async {
    String otp = otpController.text.toString();
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otp);
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      if (userCredential.user != null) {
        FirebaseFirestore.instance
            .collection("user id")
            .doc(userCredential.user!.uid)
            .collection("user data")
            .add({"phone": widget.phoneNumber});
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home_Screen()));
      }
    } on FirebaseAuthException catch (ex) {
      log(ex.code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    //pin put theme
    final focusNode = FocusNode();
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(
        fontSize: 22.sp,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Verify OTP',
              style: GoogleFonts.abhayaLibre(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600),
            ),
            SizedBox(
              height: 130.h,
            ),
            Text(
              'We sent OTP code to verify your number',
              style: GoogleFonts.abhayaLibre(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Pinput(
              keyboardType: TextInputType.number,
              controller: otpController,
              focusNode: focusNode,
              length: 6,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => SizedBox(width: 8.w),
              onClipboardFound: (value) {
                debugPrint('onClipboardFound: $value');
                otpController.setText(value);
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
            // SizedBox(
            //   height: 10.h,
            // ),
            // Custom.TextFieldWidget(
            //   "Enter your otp",
            //   FontAwesomeIcons.mobile,
            //   otpController,
            // ),
            SizedBox(
              height: 30.h,
            ),
            Custom.ReusableContainer("Verify", Colors.black, () {
              verifyOTP();
            })
          ]),
    )));
  }
}
