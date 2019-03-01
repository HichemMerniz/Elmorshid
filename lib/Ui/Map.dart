import 'package:flutter/material.dart';
import 'package:elmorshid/Ui/Reservation.dart';
import 'package:elmorshid/Ui/Place.dart';
import 'package:elmorshid/Ui/Home.dart';
//import 'package:map_view/map_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/src/core/point.dart';
import 'package:flutter_map/src/geo/crs/crs.dart';
import 'package:flutter_map/src/map/flutter_map_state.dart';
import 'package:flutter_map/src/map/map.dart';
import 'package:flutter_map/src/plugins/plugin.dart';
import 'package:latlong/latlong.dart';
var mykey = "AIzaSyCVmz1AzhIhVRLKHpo11ALECsYJyIAZqPA";
class Map extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  //  MapView.setApiKey(mykey);
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

//  MapView mapView = new MapView();
//  displayMap(){
//    mapView.show(new MapOptions(
//        mapViewType: MapViewType.normal,
//      initialCameraPosition: new CameraPosition(new Location(35.22, -101.83), 15.0),
//      showUserLocation: false,
//      title: 'Google Map'
//    ));
//  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: new AppBar(
        title: new Text('Map'),
      ),
      body: new FlutterMap(
        options: new MapOptions(
          center: new LatLng(40.73, -74.00),
          zoom: 13.0,
        ),
        layers: [
          new TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/v4/"
                "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
            additionalOptions: {
              'accessToken': 'pk.eyJ1IjoibW91bmlyemVyIiwiYSI6ImNqc2FwenNsNTA0ZHo0M3FjdTVkenV2bGMifQ.t0F8krDaxhmxII5ZQu7xHA',
              'id': 'mapbox.streets',
            },
          ),
          new MarkerLayerOptions(markers: [
            new Marker(
              width: 45.0,
              height: 45.0,
              point: new LatLng(36.0686284,4.6991422),
              builder: (context) =>new Container(
                child: IconButton(
                    icon: Icon(Icons.location_on),
                    onPressed: (){
                      print('Marker tapped');
                    },
                    color : Colors.red,
                    iconSize: 45.0,

                ),
              )
            )
          ])
        ],
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