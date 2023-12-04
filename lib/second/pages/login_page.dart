
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inistagram_clone/second/pages/signup_page.dart';
import 'package:inistagram_clone/second/services/auth/authservice.dart';
import 'package:inistagram_clone/second/widgets/uihelper.dart';
import 'package:provider/provider.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login()async{
    final authservice=Provider.of<AuthService>(context,listen: false);
    try{
      authservice.login(emailController.text, passwordController.text , context);
    }
    catch(ex){
      return UiHelper.CustomSnackbar(ex.toString(), context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.8),
        body: Center(
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
                "Welcome back you've been missed!",
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(.6)),
              ),
              SizedBox(
                height: 20.h,
              ),
              UiHelper.CustomTextField(emailController, "Email", false),
              SizedBox(
                height: 10.h,
              ),
              UiHelper.CustomTextField(passwordController, "Password", true),
              SizedBox(height: 20.h),
              UiHelper.CustomButton(() {
                login();
              }, "Sign In"),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a Member?",
                    style: TextStyle(
                        fontSize: 14, color: Colors.black.withOpacity(.7)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                      },
                      child: Text(
                        "Register now",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
