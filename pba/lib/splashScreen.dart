import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // gettingRole() async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   String role = "";
  //   print("XXXXXXXXXXXXXXXXXXXXXXXX${auth.toString()}");
  //   print("XXXXXXXXXXXXXXXXXXXXXXXX");
  //   String Batch;
  //   try {
  //     if (auth.currentUser?.uid != null) {
  //       String state = await checkRole.isTrusteeRector();
  //       if (state != "None") {
  //         myrole.Role = state;
  //         if (state == "Rector") {
  //           await UserMap.fetchRectorData();
  //         } else {
  //           await UserMap.fetchTrusteeData();
  //         }
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => const OurRoot()));
  //       } else {
  //         await UserMap.fetchStudentData();
  //         if (UserMap.dataMap != {} && UserMap.dataMap!.keys.isNotEmpty) {
  //           print(UserMap.dataMap);
  //           Map<String, dynamic> studentRole =
  //               await checkRole.checkAdminAndBatch(UserMap.dataMap!["GRN"]);
  //           print("is there error above");
  //           if (studentRole["isAdmin"] == "true") {
  //             Batch = studentRole["Batch"];
  //             myrole.Role = "studentAdmin";
  //             myrole.Batch = Batch;
  //             Navigator.pushAndRemoveUntil(
  //               context,
  //               MaterialPageRoute(builder: (context) => OurRoot()),
  //               (Route<dynamic> route) => false, // Remove all previous routes
  //             );
  //           } else if (studentRole["isAdmin"] == "false") {
  //             myrole.Role = "student";
  //             Navigator.pushAndRemoveUntil(
  //               context,
  //               MaterialPageRoute(builder: (context) => OurRoot()),
  //               (Route<dynamic> route) => false, // Remove all previous routes
  //             );
  //           }
  //         } else {
  //           myrole.Role = "student";
  //           Navigator.pushAndRemoveUntil(
  //             context,
  //             MaterialPageRoute(builder: (context) => OurRoot()),
  //             (Route<dynamic> route) => false, // Remove all previous routes
  //           );
  //         }
  //       }
  //     } else {
  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (context) => LoginPage()),
  //         (Route<dynamic> route) => false, // Remove all previous routes
  //       );
  //     }
  //   } catch (e) {
  //     print("Error Finding Role $e");
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // AfterLogin _after_ = AfterLogin();
    // gettingRole();
    print("done");

    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       // builder: (context) => Calendar(toHighlight:toHighlight,),
    //       builder: (context) => OnboardingPage1(),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Column(
              children: [
                Image.asset(
                  'asset/images/Logo.jpg',
                  height: 500,
                  width: 500,
                ),
                SpinKitThreeBounce(
                  color: Color.fromRGBO(5, 39, 76, 0.936),
                  size: 50.0,
                )

                //Text('VSS',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700,color: Color.fromARGB(255, 246, 247, 248)),)
              ],
            )),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
        /*child: const Center(
          child: Text('VSS',
           style: TextStyle(
            fontSize: 34,
            fontWeight:FontWeight.w700,
            color: Color.fromARGB(255, 246, 247, 248)
          ),)
        )*/
      ),
    );
  }
}
