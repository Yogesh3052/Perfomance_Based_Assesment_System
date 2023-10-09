import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pba/backroundVideo.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pba/login.dart';
import 'package:pba/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: 'asset/images/Logo.jpg',
        
        nextScreen: LoginPage(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
        duration: 3000,
        splashIconSize: 500,
        pageTransitionType: PageTransitionType.bottomToTop,
        // Adjust this value to increase the size
      ),

      // routes: {
      //   '/': (context) => SplashScreen(),
      // }
    );
  }
}
