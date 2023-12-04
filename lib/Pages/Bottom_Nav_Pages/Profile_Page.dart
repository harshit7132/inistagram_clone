import 'package:flutter/material.dart';
import 'package:inistagram_clone/Authentication/Email_auth/login_page.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  Widget build(BuildContext context) {
    var selectedMenu;
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              initialValue: selectedMenu,
              onSelected: (item) {
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                          color: Colors.pink,
                        ),
                        Text('first')
                      ],
                    )),
                    const PopupMenuItem(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.pink,
                        ),
                        Text('second')
                      ],
                    )),
                    const PopupMenuItem(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.coffee_maker,
                          color: Colors.pink,
                        ),
                        Text('third')
                      ],
                    )),
                  ])
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('profile'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: Text('logout'))
          ],
        ),
      ),
    );
  }
}
