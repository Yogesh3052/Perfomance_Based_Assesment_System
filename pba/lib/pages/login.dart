import 'package:flutter/material.dart';
import 'package:pba/backend/users.dart';
import 'package:pba/pages/forgotPassword.dart';
import 'package:pba/pages/homePage.dart';
import 'package:pba/pages/principalHome.dart';
import 'package:pba/widgets/input.dart';
import 'package:pba/widgets/popUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ishiddenpassword = true;
  bool value = false;
  void _togglePasswordView() {
    setState(() {
      ishiddenpassword = !ishiddenpassword;
    });
  }

  void login(String uid, String pass) {
    String pwd =
        user.userCreds.containsKey(uid) ? user.userCreds[uid]![0] : "None";
    String role = pwd == pass ? user.userCreds[uid]![1] : "None";
    if (role != "None") {
      user.mydata["Name"] = user.userData[uid]["Name"];
      user.mydata["Email"] = uid;
      user.mydata["Role"] = role;
      user.mydata["Department"] = user.userData[uid]["Department"];

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => role != "Principal"
                ? MyHomePage(
                    role: '$role',
                  )
                : PrincipalHome()), // second one for hod and faculty
        (Route<dynamic> route) => false, // Remove all previous routes
      );
    }
  }

  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/images/background4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image(
                      image: AssetImage('asset/images/hlogo.png'),
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Color.fromARGB(255, 230, 53, 56),
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Color.fromARGB(77, 7, 7, 7),
                            offset: Offset(1, 5.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: Color.fromARGB(155, 35, 74, 132),
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 35, 74, 132),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(7, 7, 7, 0.298),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 235, 233, 233),
                                      ),
                                    ),
                                  ),
                                  child: Inputfield(
                                    hintText: 'User ID',
                                    labelText: 'User ID',
                                    controller: _userIdController,
                                    prefixIcon: Icons.email,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 158, 157, 157),
                                      ),
                                    ),
                                  ),
                                  child: Securefield(
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    controller: _passwordController,
                                    prefixIcon: Icons.lock,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                print("Login button pressed");
                                if (user.userCreds.containsKey(
                                        _userIdController.text.trim()) ==
                                    true) {
                                  login(_userIdController.text.trim(),
                                      _passwordController.text.trim());
                                } else {
                                  popups.showMessage("Incorrect Credentials");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(150, 40),
                                backgroundColor:
                                    const Color.fromARGB(255, 230, 53, 56),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadowColor: Colors.black,
                              ),
                              child: const Text('Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPassword(),
                                        ),
                                      );
                                      print("Forget password is pressed");
                                    },
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),

                                // Expanded(
                                //   child: TextButton(
                                //     onPressed: () {
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //           builder: (context) =>
                                //               const SignupPage(),
                                //         ),
                                //       );
                                //     },
                                //     child: const Text(
                                //       'Sign Up',
                                //       style: TextStyle(
                                //         color: Colors.grey,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
