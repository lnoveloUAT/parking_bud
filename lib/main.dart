import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking Bud',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF832e2e),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),      ),
      home: MyHomePage(title: 'Parking, buddy!'),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _vehicleCRUD() {
    setState(() {
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VehicleCRUD()),
            );

    });
  }

  void _checkParkingLot() {
    setState(() {
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckParkingLot()),
            );

    });
  }

  void _inItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          _checkParkingLot();
          break;
        case 1:
          _vehicleCRUD();
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/images/uat.jpg')
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              ],
            ),
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_parking),
            title: Text("Check the Lot"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_data_setting),
            title: Text("Data Maintenance"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _inItemTapped,
      ),
    );
  }
}

class VehicleCRUD extends StatelessWidget {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tenant Data Maintenance"),
      ),
      // body: Center(
      //   child: RaisedButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Text('Go back!'),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            title: new Text('Search'),
          ),
          // BottomNavigationBarItem(
          //   icon: const Icon(Icons.edit),
          //   title: new Text('Edit'),
          // ),
          // BottomNavigationBarItem(
          //   icon: const Icon(Icons.save),
          //   title: new Text('Save'),
          // ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            title: new Text('Return'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (_selectedIndex) => Navigator.pop(context),
      ),
    );
  }
}

class CheckParkingLot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parking Lot Rounds"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
