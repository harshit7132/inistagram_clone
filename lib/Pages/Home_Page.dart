import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inistagram_clone/Pages/Login_Page.dart';

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
      const BottomNavigationBarItem(
          backgroundColor: Colors.black,
          label: 'Calender',
          icon: Icon(
            FontAwesomeIcons.calendar,
          )),
      const BottomNavigationBarItem(
          backgroundColor: Colors.black,
          label: 'Check',
          icon: Icon(
            FontAwesomeIcons.check,
          )),
      const BottomNavigationBarItem(
          backgroundColor: Colors.black,
          label: 'Map',
          icon: Icon(
            FontAwesomeIcons.map,
          )),
      const BottomNavigationBarItem(
          backgroundColor: Colors.black,
          label: 'User',
          icon: Icon(FontAwesomeIcons.user))
    ];

    List<Widget> bottomNavScreen = <Widget>[
      Login_Page(),
      Login_Page(),
      Login_Page(),
      Login_Page(),
    ];

    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.blue,
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
              selectedItemColor: Colors.white,
            ));
      },
    );
  }
}
