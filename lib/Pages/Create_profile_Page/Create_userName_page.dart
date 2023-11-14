import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inistagram_clone/Pages/Create_profile_Page/Create_Password_Page.dart';

import '../../Custom_widgets/UiHelper.dart';

class User_name_page extends StatefulWidget {
  const User_name_page({super.key});

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
            Custom.textField(
                userNameController, 'User name', 'UserNamePage', (value) {}),
            SizedBox(height: 25.h),
            Custom.elevatedButton(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Create_pass_Page()));
            }, 'Next')
          ],
        ),
      ),
    )));
  }
}
