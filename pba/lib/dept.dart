import 'package:flutter/material.dart';

class Departments extends StatelessWidget {
  final List<String> titles = [
    'Computer Dept',
    'AIDS Dept',
    'ENTC Dept',
    'IT Dept',
    'Electrical Dept',
    'Instrumentation Dept',
    'First Year Dept',
  ];

  // Create a list of routes corresponding to each container
  final List<Widget> containerRoutes = [
    ContainerPage(0),
    ContainerPage(1),
    ContainerPage(2),
    ContainerPage(3),
    ContainerPage(4),
    ContainerPage(5),
    ContainerPage(6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Departments'),
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.red,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
        ),
        itemCount: 7, // Number of containers
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the corresponding container route
              print('Container $index tapped');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => containerRoutes[index],
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(255, 35, 74, 132),
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
                      'asset/images/symbol$index.jpg',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    titles[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContainerPage extends StatelessWidget {
  final int index;

  ContainerPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container $index'),
      ),
      body: Center(
        child: Text(
          'This is Container $index',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
