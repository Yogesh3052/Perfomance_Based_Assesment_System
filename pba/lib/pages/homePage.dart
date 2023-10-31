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
        // title: Text('Home'),
        leading: Icon(Icons.menu),
        backgroundColor: Color.fromARGB(255, 230, 53, 56),
      ),
      body: Column(
        children: <Widget>[
          // Container(
          //   height: 50, // Adjust the height as needed
          //   child:
          //       Image.asset('asset/images/hlogo.png'), // Replace with your logo
          // ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'asset/images/symbol0.jpg',
                  ),
                ),
                SizedBox(height: 10.0),
                Column(
                  children: [
                    Text('Navle',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 35, 73, 132),
                        )),
                    Text('${widget.role}',
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 230, 53, 56),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 35, 73, 132),
                borderRadius: BorderRadius.circular(25.0)),
            child: CarouselSlider(
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
