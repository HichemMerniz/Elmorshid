import 'package:flutter/material.dart';
import 'package:elmorshid/Ui/Reservation.dart';
import 'package:elmorshid/Ui/Place.dart';
import 'package:elmorshid/Ui/Map.dart';
import 'package:elmorshid/Ui/Home.dart';

class Reservation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return resrvState();
  }

}
class resrvState extends State<Reservation>{



  void navigationTapped(int index) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    switch (index){
      case 0 :
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 1 :
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Place()),
        );
        break;
      case 2 :
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Reservation()),
        );
        break;
      case 3 :
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Map()),
        );
        break;
    }
  }
  int _cIndex=2;
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Reservation'),
        ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex:  _cIndex,

        items:[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('home'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.place),
            title: new Text('place'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.hotel),
            title: new Text('reservation'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.map),
            title: new Text('map'),

          ),
        ],
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.deepPurple,
        onTap:navigationTapped ,



      ),

    );
  }
}