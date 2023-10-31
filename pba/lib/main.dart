import 'package:flutter/material.dart';
import 'package:pba/Splash_screen.dart';
import 'package:pba/dept.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pba/pages/homePage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          '/': (context) => MyHomePage(),
        });
  }
}
