import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pba/pages/login.dart';

class MyHomePage extends StatefulWidget {
  final String role;
  const MyHomePage({super.key, required this.role});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> imageList = [
    Image.asset('asset/coursel/c1.jpeg'),
    Image.asset('asset/coursel/c2.jpeg'),
    Image.asset('asset/coursel/c3.jpeg'),
    Image.asset('asset/coursel/c4.jpeg'),
    Image.asset('asset/coursel/c5.png'),

    // Add more images or widgets as needed.
  ];
  final List<Widget> containerRoutes = [
    FirstPage(),
    SecondPage(),
  ];
  final List<String> titles = [
    'Create New Application',
    'View Application',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color.fromARGB(255, 230, 53, 56),
      ),
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Navale Girish"),
            accountEmail: const Text('Assistant Professor,\nAISSMS IOIT, PUNE'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('asset/images/Navale.jpg'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.note_add_outlined),
            title: const Text('Create Applications'),
            onTap: () {
              // Implement the action for the Profile Page button here
            },
          ),
          ListTile(
            leading: const Icon(Icons.view_agenda_outlined),
            title: const Text('View Applications'),
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
      body: Column(
        children: <Widget>[
          // Container(
          //   height: 50, // Adjust the height as needed
          //   child:
          //       Image.asset('asset/images/hlogo.png'), // Replace with your logo
          // ),
          SizedBox(
            height: 20,
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
                    backgroundImage: AssetImage('asset/images/Navale.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Navale Girish',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Assistant Professor,\nAISSMS IOIT, PUNE',
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

          SizedBox(
            height: 15,
          ),

          Container(
            height: 260,
            width: MediaQuery.of(context).size.width * 0.97,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 35, 73, 132),
                borderRadius: BorderRadius.circular(25.0)),
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
                    color: Colors.white,
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
          Expanded(
            child: GridView.builder(
              itemCount: 2,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => containerRoutes[index],
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color.fromARGB(255, 230, 53, 56),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5.0,
                          blurRadius: 7.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60.0,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            'asset/images/icon$index.jpg',
                          ),
                        ),
                        SizedBox(height: 10.0),
                        FittedBox(
                          child: Text(
                            titles[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Text('This is the First Page'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('This is the Second Page'),
      ),
    );
  }
}
