
// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inistagram_clone/firebase_options.dart';
import 'package:inistagram_clone/second/services/auth/authservice.dart';
import 'package:inistagram_clone/second/services/auth_gate.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child:const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chatting App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          ),
          home: AuthGate()),
    );
  }
}
