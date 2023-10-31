import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';

class PrincipalHome extends StatefulWidget {
  const PrincipalHome({super.key});

  @override
  State<PrincipalHome> createState() => _PrincipalHomeState();
}

class _PrincipalHomeState extends State<PrincipalHome> {
  List<Widget> imageList = [
    Image.asset('asset/images/aissms-ioit-logo (1).png'),
    Image.asset('asset/images/Logo.jpg'),

    // Add more images or widgets as needed.
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Principal Home'),
        backgroundColor: Color.fromARGB(255, 28, 176, 221),
      ),
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Dr. P. B. Mane"),
            accountEmail: const Text('Principal, AISSMS IOIT, PUNE'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('asset/images/principal.jpg'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Departments'),
            onTap: () {
              // Implement the action for the Profile Page button here
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {},
          ),
        ],
      )),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.97,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                        'asset/images/bluebackground.jpg'), // Replace 'background_image.jpg' with the actual image path in your assets.
                    fit: BoxFit
                        .cover, // Adjust the fit type according to your requirement.
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('asset/images/principal.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. P. B. Mane',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Principal,\nAISSMS IOIT, PUNE',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              height: 270,
              width: MediaQuery.of(context).size.width * 0.97,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                        'asset/images/background21.jpg'), // Replace 'background_image.jpg' with the actual image path in your assets.
                    fit: BoxFit
                        .cover, // Adjust the fit type according to your requirement.
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'AISSMS IOIT, PUNE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      initialPage: 0,
                      autoPlayInterval: const Duration(seconds: 2),
                    ),
                    items: imageList,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
