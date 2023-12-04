import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inistagram_clone/Bloc/bloc_Controllers/logIn_Controllers.dart';
import 'package:inistagram_clone/Bloc/login_Bloc/log_in_bloc.dart';
import 'package:inistagram_clone/Pages/Create_profile_Page/FullName_page.dart';
import 'package:inistagram_clone/Pages/Forgot_Page.dart';
import 'package:inistagram_clone/Services/auth/authservice.dart';
import 'package:provider/provider.dart';

import '../../Custom_widgets/UiHelpee-2.dart';
import '../../Custom_widgets/uihelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    final authservice = Provider.of<AuthService>(context, listen: false);
    try {
      authservice.login(emailController.text, passwordController.text, context);
    } catch (ex) {
      return UiHelper.CustomSnackbar(ex.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.8),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.blue.shade600,
                Colors.black,
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'English (IN)',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 70.h,
                width: 70.w,
                child: Image.asset(
                  'assets/images/pngwing.com.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Custom.textField(
                  emailController, 'Username, email or mobile', 'Login_page',
                  (value) {
                context.read<LogInBloc>().add(EmailEvent(value));
              }),
              SizedBox(
                height: 10.h,
              ),
              Custom.textField(passwordController, 'Password', 'Login_page',
                  (value) {
                context.read<LogInBloc>().add(PasswordEvent(value));
              }),
              SizedBox(
                height: 10.h,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Forgot_Page()));
                  },
                  child: Text(
                    'Forgotten Password?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
              SizedBox(height: 20.h),
              Custom.elevatedButton(() {
                LoginController(context: context).login();
              }, 'Log In'),
              SizedBox(
                height: 35.h,
              ),
              Container(
                height: 40.h,
                width: 300.w,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20)),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            //SignUpPage()
                            builder: (context) => Full_name_page()));
                  },
                  child: Text('Create new account',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
