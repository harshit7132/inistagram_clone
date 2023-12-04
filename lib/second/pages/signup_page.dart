
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inistagram_clone/second/pages/homescreen.dart';
import 'package:inistagram_clone/second/pages/login_page.dart';
import 'package:inistagram_clone/second/services/auth/authservice.dart';
import 'package:inistagram_clone/second/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();

  void signUp()async{
    final authService=Provider.of<AuthService>(context,listen: false);
    if(passwordController.text!=confirmPasswordController.text){
      return UiHelper.CustomSnackbar("Password Does'nt Match", context);
    }
    else{
      try{
        await authService.signUp(emailController.text.toString(), passwordController.text.toString(), confirmPasswordController.text.toString(), context).then((value){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
        });
      }
      catch(ex){
        return UiHelper.CustomSnackbar(ex.toString(), context);
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.8),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.chat,
                  size: 90.h,
                  color: Colors.black.withOpacity(.7),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Let's create an account for you!",
                  style: TextStyle(
                      fontSize: 15, color: Colors.black.withOpacity(.8)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                UiHelper.CustomTextField(emailController, "Email", false),
                SizedBox(
                  height: 10.h,
                ),
                UiHelper.CustomTextField(passwordController, "Password", true),
                SizedBox(
                  height: 10.h,
                ),
                UiHelper.CustomTextField(confirmPasswordController, "Confirm Password", true),
                SizedBox(height: 20.h),
                UiHelper.CustomButton(() {
                  signUp();
                }, "Sign Up"),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a Member?",
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.black.withOpacity(.7)),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        child: Text(
                          "Login now",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}