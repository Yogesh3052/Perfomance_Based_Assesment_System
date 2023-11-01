import 'package:flutter/material.dart';
import 'package:pba/backend/firestoreFunctions.dart';
import 'package:pba/backend/users.dart';
import 'package:pba/widgets/input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pba/widgets/popUp.dart';

class reviewPage extends StatefulWidget {
  final String userid;
  const reviewPage({super.key, required this.userid});

  @override
  State<reviewPage> createState() => _reviewPageState();
}

class _reviewPageState extends State<reviewPage> {
  bool _isdatafetched = false;
  Map<String, dynamic>? allData = {};
  void fetchdata() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection(user.mydata["Department"])
          .doc("faculty@gmail.com")
          .get();
      setState(() {
        _isdatafetched = true;
        allData = snapshot.data();
      });
      // all_data = {...?all_data, ...?documentData};
    } catch (e) {
      print("Error gettting Leaves: $e");
    }
  }

  _sendDataToFirestore(Map<String, dynamic> data) {
    addDataToFirestore(
        context, user.mydata["Department"], "faculty@gmail.com", data);
    popups.showMessage("Application Submitted Successfully");
  }

  @override
  void initState() {
    super.initState();
    fetchdata(); // Call the async function here
  }

  @override
  Widget build(BuildContext context) {
    // Replace your TextEditingController declarations with this
    Map<String, dynamic>? data = allData;

    var hodApiScoreController = TextEditingController();
    var principalApiScoreController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Application Page'),
      ),
      body: _isdatafetched == true
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 450,
                      height: 50,
                      color: Colors.blueAccent,
                      child: Center(
                          child: Text(
                        'PART A',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Teaching Process (Max Point:25)',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Subject: ${allData!["Subject"]}",
                    ),
                    // Inputfield(
                    // hintText: "Enter Subject",
                    // labelText: "Subject",
                    // controller: subjectController,
                    // enableText: false,
                    // ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Semester : ${allData!["Semester"]}"),
                    // Inputfield(
                    //   hintText: "Enter the Semester",
                    //   labelText: "Semester",
                    //   controller: actualHeldClassesController,
                    //   enableText: false,
                    // ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("No. of Classes :  ${allData!["Classes"]}"),
                    // Inputfield(
                    //   hintText: "Enter No. of Classes",
                    //   labelText: "No. of Classes ",
                    //   controller: totalClassesController,
                    //   enableText: false,
                    // ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        "Actual held classes  :  ${allData!["ActualClasses"]}"),
                    // Inputfield(
                    //   hintText: "Enter No. of Actual Held Classes",
                    //   labelText: "No. of Actual Held Classes",
                    //   controller: actualHeldClassesController,
                    //   enableText: false,
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'API Score',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Faculty :  ${allData!["FacultyApi"]}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    Text("Faculty"),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'HOD:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    (user.mydata["Role"] != "Principal" &&
                            user.mydata["Role"] != "Faculty")
                        ? Inputfield(
                            hintText: "Enter API Score",
                            labelText: "API Score",
                            enabled:
                                user.mydata["Role"] == "Hod" ? true : false,
                            controller: hodApiScoreController,
                          )
                        : Text("Api Score ${allData!["HodApi"]}"),

                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Principal:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    (user.mydata["Role"] != "Hod" &&
                            user.mydata["Role"] != "Faculty")
                        ? Inputfield(
                            hintText: "Enter API Score",
                            labelText: "API Score",
                            enabled: user.mydata["Role"] == "Principal"
                                ? true
                                : false,
                            controller: principalApiScoreController,
                          )
                        : Text("Api Score ${allData!["PrincipalApi"]}"),
                    SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          user.mydata["Role"] == "Hod"
                              ? allData!["HodApi"] =
                                  hodApiScoreController.text.trim()
                              : allData!["PrincipalApi"] =
                                  principalApiScoreController.text.trim();
                          _sendDataToFirestore(allData!);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ))
                  ],
                ),
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
