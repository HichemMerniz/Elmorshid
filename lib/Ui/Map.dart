import 'package:flutter/material.dart';
import 'package:elmorshid/Ui/Reservation.dart';
import 'package:elmorshid/Ui/Place.dart';
import 'package:elmorshid/Ui/Home.dart';
import 'package:map_view/map_view.dart';
var mykey = "AIzaSyCVmz1AzhIhVRLKHpo11ALECsYJyIAZqPA";
class Map extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    MapView.setApiKey(mykey);
    // TODO: implement createState
    return mapState();
  }

}
class mapState extends State<Map>{

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
  int _cIndex=3;
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  MapView mapView = new MapView();
  displayMap(){
    mapView.show(new MapOptions(
        mapViewType: MapViewType.normal,
      initialCameraPosition: new CameraPosition(new Location(35.22, -101.83), 15.0),
      showUserLocation: false,
      title: 'Google Map'
    ));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: new AppBar(
        title: new Text('Map'),
      ),
      body: new Center(
        child: Container(
          child: RaisedButton(
            child: Text("clicker"),
            color: Colors.deepPurpleAccent,
            textColor: Colors.white,
            elevation: 7.0,
            onPressed: displayMap,
          ),
        ),
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