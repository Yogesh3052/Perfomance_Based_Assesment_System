import 'package:flutter/material.dart';
import 'package:pba/pages/backroundVideo.dart';
import 'package:pba/pages/login.dart';
import 'package:pba/pages/splashScreen.dart';

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
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 230, 53, 56),
              secondary: Color.fromARGB(255, 35, 73, 132)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => LoginPage(),
        });
  }
}
