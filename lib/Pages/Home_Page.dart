import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inistagram_clone/Pages/Bottom_Nav_Pages/Profile_Page.dart';
import 'package:inistagram_clone/Pages/Bottom_Nav_Pages/Reels_Page.dart';
import 'package:inistagram_clone/Pages/Bottom_Nav_Pages/Search_Page.dart';
import 'package:inistagram_clone/Pages/Bottom_Nav_Pages/Upload_Page.dart';
import 'package:inistagram_clone/Pages/Chat_pages/homescreen.dart';

import '../Bloc/bottom_Nav_Bloc/bottom_nav_bloc.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavIcons = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          backgroundColor: Colors.black,
          label: '',
          icon: Icon(
            FontAwesomeIcons.home,
            size: 20.sp,
          )),
      BottomNavigationBarItem(
          backgroundColor: Colors.black,
          label: '',
          icon: Icon(
            FontAwesomeIcons.search,
            size: 20.sp,
          )),
      BottomNavigationBarItem(
          backgroundColor: Colors.black,
          label: '',
          icon: Icon(
            FontAwesomeIcons.add,
            size: 20.sp,
          )),
      BottomNavigationBarItem(
          backgroundColor: Colors.black,
          label: '',
          icon: Icon(
            FontAwesomeIcons.video,
            size: 20.sp,
          )),
      BottomNavigationBarItem(
          backgroundColor: Colors.black,
          label: '',
          icon: Icon(FontAwesomeIcons.user, size: 20.sp))
    ];

    List<Widget> bottomNavScreen = <Widget>[
      HomeScreen(),
      Search_Page(),
      Upload_Page(),
      Reels_Page(),
      Profile_Page(),
    ];

    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
            body: Center(child: bottomNavScreen[state.tabIndex]),
            bottomNavigationBar: BottomNavigationBar(
                items: bottomNavIcons,
                currentIndex:
                    BlocProvider.of<BottomNavBloc>(context).state.tabIndex,
                onTap: (index) {
                  setState(() {
                    BlocProvider.of<BottomNavBloc>(context)
                        .add(Tabchange(tabIndex: index));
                  });
                },
                selectedItemColor: Colors.white));
      },
    );
  }
}
