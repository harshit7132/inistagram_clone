// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom {
  static textField(
    TextEditingController controller,
    String hint,
    String text,
    void Function(String value)? func,
  ) {
    return Container(
      height: 55.h,
      width: 320.w,
      decoration: BoxDecoration(
          color: text == "UserNamePage" ? Colors.white38 : Colors.black12,
          borderRadius: BorderRadius.circular(10.w)),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, left: 20.w),
        child: TextField(
            controller: controller,
            onChanged: (value) => func!(value),
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                    color: text == "UserNamePage" ? Colors.white : Colors.grey),
                border: InputBorder.none)),
      ),
    );
  }

  static elevatedButton(VoidCallback function, String text) {
    return Container(
      height: 45.h,
      width: 320.w,
      child: ElevatedButton(
          onPressed: function,
          child: Text(text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))))),
    );
  }

  static ReusableContainer(final String title, final Color containerColor,
      final VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: containerColor),
        child: Center(
            child: Text(
          title,
          style: GoogleFonts.abhayaLibre(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22.sp),
        )),
      ),
    );
  }

  static TextFieldWidget(
      final String hintText,
      final IconData iconData,
      final TextEditingController controller,
      final TextInputType? keyBoardtype) {
    return Card(
      color: Colors.grey.shade200,
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: TextField(
          keyboardType: keyBoardtype,
          controller: controller,
          style: GoogleFonts.abhayaLibre(
              color: Colors.grey.shade600, fontSize: 18.sp),
          decoration: InputDecoration(
              prefixIcon: Icon(iconData),
              hintText: hintText,
              hintStyle: GoogleFonts.abhayaLibre(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                  fontSize: 18.sp),
              border: InputBorder.none),
        ),
      ),
    );
  }

  static PaddingText(final String title, final double top) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.sp),
      ),
    );
  }

  static CustomSnackBar(String text, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        text,
        style: TextStyle(fontSize: 12.sp, color: Colors.white),
      ),
      backgroundColor: Colors.red,
    ));
  }
}
