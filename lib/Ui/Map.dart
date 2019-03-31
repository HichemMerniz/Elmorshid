import 'package:flutter/material.dart';
import 'package:elmorshid/Ui/Reservation.dart';
import 'package:elmorshid/Ui/Place.dart';
import 'package:elmorshid/Ui/Home.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
class map extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    //  MapView.setApiKey(mykey);
    // TODO: implement createState
    return mapState();
  }

}
class mapState extends State<map>{
  Completer<GoogleMapController> _controller = Completer();
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
          MaterialPageRoute(builder: (context) => map()),
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
  Map<String, double> currentLocation = new Map();
  StreamSubscription<Map<String,double>> locationSubscription;
  Location location = new Location();
  String error ;
  @override
  void initState(){
    super.initState();
    //default variables set is 0
    currentLocation['latitude'] = 0.0;
    currentLocation['longitude'] = 0.0;
    initPlatformState();
    locationSubscription = location.onLocationChanged().listen((Map<String,double> result){
      setState(() {
        currentLocation = result;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: new AppBar(
        title: new Text('Map'),
      ),
      body: Stack(
        children: <Widget>[
          _googlemap(context),

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
  Widget _googlemap(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType : MapType.normal,
        initialCameraPosition: CameraPosition(target: LatLng(currentLocation['latitude'].toDouble(), currentLocation['longitude'].toDouble()), zoom: 12),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }

  Future initPlatformState() async {
    Map<String,double> mylocation;
    try{
      mylocation = await location.getLocation();
      error = '';
    }on PlatformException catch(e){
      if(e.code == "PERMISSION_DENIED")
        error = 'permission denied';
      else{
        error = 'please go to settings !';
      }
      mylocation = null ;
    }
    setState(() {
      currentLocation = mylocation;

    });
  }
}