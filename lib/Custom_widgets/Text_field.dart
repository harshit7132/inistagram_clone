import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custom {
  static textField(TextEditingController controller, String hint, String text) {
    return Container(
      height: 55.h,
      width: 320.w,
      decoration: BoxDecoration(
          color: text == "UserNamePage" ? Colors.white38 : Colors.black12,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, left: 20.w),
        child: TextField(
            controller: controller,
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
      height: 40.h,
      width: 320.w,
      child: ElevatedButton(
          onPressed: function,
          child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))))),
    );
  }
}
