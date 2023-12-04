import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelper {
  static CustomTextField(
      TextEditingController controller, String text, bool ToHide) {
    return Container(
      height: 50.h,
      width: 320.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w),
          color: Colors.white.withOpacity(.6)),
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, left: 20.w),
        child: TextField(
          controller: controller,
          obscureText: ToHide,
          decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
              border: InputBorder.none),
        ),
      ),
    );
  }

  static CustomButton(VoidCallback callback, String text) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        height: 50.h,
        width: 320.w,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  static CustomSnackbar(String text, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
