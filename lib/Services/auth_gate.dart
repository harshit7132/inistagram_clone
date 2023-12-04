// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../Authentication/Email_auth/login_page.dart';
// import '../Pages/Chat_pages/homescreen.dart';
//
// class AuthGate extends StatefulWidget {
//   const AuthGate({super.key});
//
//   @override
//   State<AuthGate> createState() => _AuthGateState();
// }
//
// class _AuthGateState extends State<AuthGate> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return HomeScreen();
//             } else {
//               return LoginPage();
//             }
//           }),
//     );
//   }
// }
