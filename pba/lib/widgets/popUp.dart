import 'package:flutter/material.dart';
import 'package:pba/main.dart';
import 'package:pba/pages/splashScreen.dart';

class popups {
  static showMessage(String Message) {
    Icon icn = Icon(Icons.close);

    showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Message"),
          content: Text(Message),
          actions: [
            IconButton(
              icon: icn,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
