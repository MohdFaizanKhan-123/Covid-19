import 'package:covid/screens/bottomNavigation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Covid-19 Tracker',
      home: SplashScreen(
        seconds: 5,
        imageBackground: AssetImage(
          'images/splash.jpg',
        ),
        loadingText: Text('Stay Home, Stay Safe!',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w300)),
        loaderColor: Color(0xffB39DDB),
        navigateAfterSeconds: BottomNavigation(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
