import 'dart:async';


import 'package:flutter/material.dart';
import 'package:pba/widgets/input.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Check your email'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please check your inbox for email to reset password',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 12),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  final _emailController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background5.jpg', // Replace this with your image path
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   colors: [
                //     const Color.fromARGB(255, 255, 89, 0),
                //     const Color.fromARGB(255, 238, 121, 25),
                //     const Color.fromARGB(255, 252, 152, 1),
                //   ],
                // ),
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 200,
                        top: 200,
                        left: 30,
                        right: 30,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.3,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 44, 1, 28),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 30,
                              ),
                              const FittedBox(
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 24, 138, 142),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Expanded(
                                child: FractionallySizedBox(
                                  heightFactor: 0.5,
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.298),
                                            blurRadius: 20,
                                            offset: Offset(0, 10),
                                          ),
                                        ],
                                      ),
                                      child: Inputfield(
                                        hintText: "Enter Email",
                                        labelText: "Email ID.",
                                        controller: _emailController,
                                        //validator: Validations.validate_email,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 40,
                              ),
                              ElevatedButton(
                                onPressed: () => Timer(
                                  const Duration(seconds: 1),
                                  () {
                                  
                                    _showDialog();
                                  },
                                ),
                                style: TextButton.styleFrom(
                                  minimumSize: const Size(150, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadowColor: Colors.black,
                                ),
                                child: const Text("Submit"),
                              ),
                              // Add more widgets below the "Submit" button if needed
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
