import 'package:flutter/material.dart';
import 'package:inistagram_clone/Services/notification_Services.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  var notificationServices = Notification_Services();
  @override
  void initState() {
    super.initState();
    notificationServices.initilize(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text('From Notification'),
                    ),
                  )));
    });
  }

  //InApp_notification inApp_notification = InApp_notification();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            notificationServices.sendNotification(
                title: 'first title', body: 'first this is body');
          },
          child: Text('send notify'),
        ),
      ),
    );
  }
}
