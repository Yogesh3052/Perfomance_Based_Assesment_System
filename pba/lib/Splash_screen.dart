import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pba/Splash_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pba/login.dart';
import 'package:pba/splashScreen.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Stack(
  children: [
    AnimatedSplashScreen(
      splash: 'asset/images/Logo.jpg',
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.white,
      duration: 3000,
      splashIconSize: 500,
    ),
    Positioned(
      top: 500,
      left: 0,
      right: 0,
      bottom: 0,
      child: Center(
        child: SpinKitThreeBounce(
                  color: Color.fromRGBO(5, 39, 76, 0.936),
                  size: 50.0,
                ), // Replace with your custom animated widget
      ),
    ),
  ],
);


      // routes: {
      //   '/': (context) => SplashScreen(),
      // }
    
  }
}
