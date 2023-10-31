import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatelessWidget {
  List<Widget> imageList = [
    Image.asset('asset/images/aissms-ioit-logo (1).png'),
    Image.asset('asset/images/Logo.jpg'),

    // Add more images or widgets as needed.
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Page with Carousel'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 150, // Adjust the height as needed
            child: Image.asset(
                'asset/images/aissms-ioit-logo (1).png'), // Replace with your logo
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
          GestureDetector(
            onTap: () {
              // Navigate to the first page on container click
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstPage()));
            },
            child: Container(
              color: Colors.orange,
              height: 50, // Adjust the container height
              alignment: Alignment.center,
              child: Text(
                'Go to First Page',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to the second page on container click
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Container(
              color: Colors.red,
              height: 50, // Adjust the container height
              alignment: Alignment.center,
              child: Text(
                'Go to Second Page',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
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
