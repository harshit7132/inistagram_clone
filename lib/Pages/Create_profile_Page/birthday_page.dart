import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Custom_widgets/UiHelper.dart';

class Birthday_page extends StatefulWidget {
  const Birthday_page({super.key});

  @override
  State<Birthday_page> createState() => _Birthday_pageState();
}

class _Birthday_pageState extends State<Birthday_page> {
  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    DateTime date = DateTime(2023, 11, 10);

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
            SizedBox(height: 25.h),
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
              child: Custom.textField(
                  dateController,
                  dateController == null
                      ? 'Date of birth'
                      : '${date.month}-${date.day}-${date.year}',
                  'UserNamePage',
                  (value) {}),
            ),
            SizedBox(height: 25.h),
            Custom.elevatedButton(() {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: DatePickerDialog(
                        lastDate: DateTime(2030),
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022, 12),
                      ),
                    );
                  });
            }, 'Next')
          ],
        ),
      ),
    )));
  }

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
}
