import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inistagram_clone/Custom_widgets/UiHelpee-2.dart';

class Search_Page extends StatefulWidget {
  const Search_Page({super.key});

  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Search '),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text('search'),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                UiHelper.CustomTextField(
                    searchController, 'Search Users', false),
                Icon(
                  Icons.search,
                  size: 30.sp,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
