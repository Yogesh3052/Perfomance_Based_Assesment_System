import 'package:flutter/material.dart';
import 'package:pba/main.dart';
import 'package:pba/pages/homePage.dart';
import 'package:pba/pages/splashScreen.dart';
import 'package:pba/backend/users.dart';

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
                if (Message.contains("Application Submitted Successfully")) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => user.mydata["Role"] == "Principal"
                            ? MyHomePage(
                                role: '${user.mydata["Role"]}',
                              )
                            : MyHomePage(
                                role: '${user.mydata["Role"]}',
                              )), // second one for hod and faculty
                    (Route<dynamic> route) =>
                        false, // Remove all previous routes
                  );
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
