import 'package:flutter/material.dart';
import 'package:pba/backend/firestoreFunctions.dart';
import 'package:pba/backend/users.dart';
import 'package:pba/widgets/input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pba/widgets/popUp.dart';

class applicationPage extends StatefulWidget {
  const applicationPage({super.key});

  @override
  State<applicationPage> createState() => _applicationPageState();
}

class _applicationPageState extends State<applicationPage> {
  _sendDataToFirestore(Map<String, dynamic> data) {
    addDataToFirestore(
        context, user.mydata["Department"], user.mydata["Email"], data);
    popups.showMessage("Application Submitted Successfully");
  }

  @override
  Widget build(BuildContext context) {
    var subjectController = TextEditingController();
    var totalClassesController = TextEditingController();
    var actualHeldClassesController = TextEditingController();
    var semestercontroller = TextEditingController();
    var apifacultycontroller = TextEditingController();
    var apihodcontroller = TextEditingController();
    var apiprincipalcontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Application Page'),
      ),
      body: Padding(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Teaching Process (Max Point:25)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Inputfield(
                  hintText: "Enter Subject",
                  labelText: "Subject",
                  controller: subjectController),
              SizedBox(
                height: 8,
              ),
              Inputfield(
                  hintText: "Enter the Semester",
                  labelText: "Semester",
                  controller: semestercontroller),
              SizedBox(
                height: 8,
              ),
              Inputfield(
                  hintText: "Enter No. of Classes",
                  labelText: "No. of Classes ",
                  controller: totalClassesController),
              SizedBox(
                height: 8,
              ),
              Inputfield(
                  hintText: "Enter No. of Actual Held Classes",
                  labelText: "No. of Actual Held Classes",
                  controller: actualHeldClassesController),
              SizedBox(
                height: 10,
              ),
              Text(
                'API Score',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Faculty:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Inputfield(
                  hintText: "Enter API Score",
                  labelText: "API Score",
                  controller: apifacultycontroller),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'HOD:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Inputfield(
                  hintText: "Enter API Score",
                  labelText: "API Score",
                  controller: apihodcontroller),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Principal:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Inputfield(
                  hintText: "Enter API Score",
                  labelText: "API Score",
                  controller: apiprincipalcontroller),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    Map<String, dynamic> application = {
                      "Subject": subjectController.text.trim(),
                      "Semester": semestercontroller.text.trim(),
                      "Classes": totalClassesController.text.trim(),
                      "ActualClasses": subjectController.text.trim(),
                      "FacultyApi": apifacultycontroller.text.trim()
                    };
                    _sendDataToFirestore(application);
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
      ),
    );
  }
}
