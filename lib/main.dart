import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:inistagram_clone/Pages/Home_Page.dart';
import 'package:inistagram_clone/Pages/IntroScreen_Page/introScreen_Page.dart';
import 'package:inistagram_clone/firebase_options.dart';

import 'Bloc/SignIN_bloc/sign_in_bloc.dart';
import 'Bloc/bottom_Nav_Bloc/bottom_nav_bloc.dart';
import 'Bloc/login_Bloc/log_in_bloc.dart';
import 'Services/notification_Services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LogInBloc(),
          ),
          BlocProvider(
            create: (context) => SignInBloc(),
          ),
          BlocProvider(
            create: (context) => BottomNavBloc(),
          ),
        ],
        child: ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Instagram Clone',
              home: child,
            );
          },
          child: FirebaseAuth.instance.currentUser != null
              ? Home_Screen()
              : Intro_Screen(),
        ));
  }
}
