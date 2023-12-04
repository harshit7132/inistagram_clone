import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inistagram_clone/Authentication/Email_auth/login_page.dart';
import 'package:introduction_slider/introduction_slider.dart';

class Intro_Screen extends StatefulWidget {
  const Intro_Screen({super.key});

  @override
  State<Intro_Screen> createState() => _Intro_ScreenState();
}

class _Intro_ScreenState extends State<Intro_Screen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionSlider(
      items: [
        IntroductionSliderItem(
            logo: Image.network(
                'https://imgs.search.brave.com/-zme1_yb1tZRRNG26_GvAWOINIz3RM8QxyLeQcTdLZs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAzLzY3LzM1Lzcy/LzM2MF9GXzM2NzM1/NzIwOV9CRzA3U1Zu/bkI0SFNIU2FNaUhh/amZaaHJaWkFFODU5/QS5qcGc',
                width: 500),
            title: Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                  "Welcome to our app, where innovation meets convenience! We are thrilled to have you join our community of forward-thinkers and tech enthusiasts. Get ready to embark on a seamless and engaging experience tailored just for you. Whether you're here for productivity, entertainment, or a bit of both, our app is designed to enhance every aspect of your digital journey. Explore the endless possibilities, discover new features, and make the most of the cutting-edge technology at your fingertips. Your presence adds value to our growing family, and we are committed to providing you with a user-friendly environment that goes beyond expectations. Dive in, explore, and enjoy the boundless opportunities that await you. Welcome aboard!",
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.5)),
            ),
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue, Colors.white, Colors.black],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        IntroductionSliderItem(
            logo: Text(
                'Capture Life`s Canvas: Your Moments, Your Story – Welcome to VisualVibe!',
                style: GoogleFonts.abhayaLibre(
                    fontSize: 30, fontWeight: FontWeight.bold)),
            title: Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                  "Unleash your creativity, ignite the spark, In the world of VisualVibe, make your mark. A visual journey, where moments come alive, Through filters and frames, let your story thrive. Snap and share, with a tap and a click, Every image tells a tale, every moment, a pick. From sunrise hues to midnight skies,  In the realm of VisualVibe, let your vision rise.  Connect with hearts, across the globe, A community of dreamers, where stories unfold.  Filters for joy, frames for the bold,VisualVibe, where memories are gold.",
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.5)),
            ),
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue, Colors.white, Colors.black],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        IntroductionSliderItem(
            logo: Image.network(
              'https://imgs.search.brave.com/UDNd2LsmouimMYbUOn0Qto8J8P2eOisRmgklBHXLGTE/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9sZXQt/cy1nZXQtc3RhcnRl/ZC1sZXQtcy1nZXQt/c3RhcnRlZC1tb3Rp/dmF0aW9uYWwtY29u/Y2VwdC0xMjM4MDI4/NDYuanBn',
              width: 500,
            ),
            title: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text("Let`s get Started"),
            ),
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue, Colors.white, Colors.black],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
      ],
      done: Done(
        child: Icon(
          Icons.done,
          color: Colors.pink,
        ),
        home: LoginPage(),
      ),
      next: Next(child: Icon(Icons.arrow_forward)),
      back: Back(child: Icon(Icons.arrow_back)),
      dotIndicator: DotIndicator(),
    );
  }
}
