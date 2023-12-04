// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inistagram_clone/Custom_widgets/uihelper.dart';
import 'package:inistagram_clone/Pages/Home_Page.dart';

import '../../Models/userModel.dart';
import '../SignIN_bloc/sign_in_bloc.dart';

class SignUpController {
  final BuildContext context;
  SignUpController({required this.context});
  signUp() async {
    final state = context.read<SignInBloc>().state;
    String email = state.email.trim();
    String password = state.password.trim();
    if (email == " " && password == " ") {
      Custom.CustomSnackBar("Enter Required Fields", context);
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (ex) {
        Custom.CustomSnackBar(ex.code.toString(), context);
      }
      if (usercredential != null) {
        String uid = usercredential.user!.uid;

        FirebaseFirestore.instance
            .collection("Users")
            .doc(email)
            .set(UserModel(
              username: '',
              email: email,
              password: password,
              mobile: '',
              id: uid,
              fullName: '',
              dob: '',
            ).toMap())
            .then((value) {
          log("User Created!!");
          Custom.CustomSnackBar("Welcome $email", context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Home_Screen()));
        });
      }
    }
  }
}
