// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inistagram_clone/Bloc/login_Bloc/log_in_bloc.dart';
import 'package:inistagram_clone/Custom_widgets/uihelper.dart';
import 'package:inistagram_clone/Pages/Home_Page.dart';

class LoginController {
  final BuildContext context;
  LoginController({required this.context});
  login() async {
    final state = context.read<LogInBloc>().state;
    String email = state.email.trim();
    String password = state.password.trim();
    if (email == " " || password == " ") {
      Custom.CustomSnackBar("Enter Required Fields", context);
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Home_Screen()));
        });
      } on FirebaseAuthException catch (ex) {
        Custom.CustomSnackBar(ex.code.toString(), context);
      }
    }
  }
}
