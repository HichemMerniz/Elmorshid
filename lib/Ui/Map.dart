import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:elmorshid/Ui/Reservation.dart';
import 'package:elmorshid/Ui/Place_Avitivity.dart';
import 'package:elmorshid/Ui/addPlace.dart';
import 'package:elmorshid/Models/place.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:elmorshid/Ui/Home.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class map extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //  MapView.setApiKey(mykey);
    // TODO: implement createState
    return mapState();
  }
}

class mapState extends State<map> {
  GoogleMapController mapController;
  void navigationTapped(int index) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => placeAvtivity()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Reservation()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => map()),
        );
        break;
    }
  }

  int _cIndex = 3;
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }



  Map<String, double> currentLocation = new Map();
  StreamSubscription<Map<String, double>> locationSubscription;
  Location location = new Location();
  String error;
  List<Place> place_liste = List();
  Place place;
  final FirebaseDatabase database = FirebaseDatabase();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  DatabaseReference databasereference;
  @override
  void initState() {
    super.initState();
    //default variables set is 0
    place = new Place("","");
    databasereference = database.reference().child("places");
    databasereference.onChildAdded.listen(_onEntryAdd) ;
    initPlatformState();
    locationSubscription =
        location.onLocationChanged().listen((Map<String, double> result) {
      setState(() {
        currentLocation = result;
      });
    });
  }


  File sampleImage;

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      sampleImage = tempImage;
    });
  }
  Future getPhoto() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage;
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
        currentIndex: _cIndex,
        items: [
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
        onTap: navigationTapped,
      ),
    );
  }

  Widget _googlemap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: <Widget>[
      GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
            target: LatLng(
                12.00, 10.00),
            zoom: 15),
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        compassEnabled: true,
        trackCameraPosition: true,
      ),
      Positioned(
          bottom: 10,
          right: 10,
          left: 10,
          child: 
          FlatButton(
              onPressed: _addmarker,
              child: new Center(
                child: new Row(
                  children: <Widget>[

                    Icon(Icons.pin_drop, color: Colors.white,),
                    new Text('Add this place !'),
                  ],
                ),
              ) ,
              textColor: Colors.white,
              color: Colors.deepPurple,
          ),
      ),
      ],),

    );
  }
  _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
  Future initPlatformState() async {
    Map<String, double> mylocation;
    try {
      mylocation = await location.getLocation();
      error = '';
    } on PlatformException catch (e) {
      if (e.code == "PERMISSION_DENIED")
        error = 'permission denied';
      else {
        error = 'please go to settings !';
      }
      mylocation = null;
    }
    setState(() {
      currentLocation = mylocation;
    });
  }


  createAlertDialog(BuildContext context){
    TextEditingController mycontroller = TextEditingController();

    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text('Add this position'),

        content: Column(
            children: <Widget>[
              Flexible(
            flex: 0,
            child: Form(
              key: formkey,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.subject),
                    title: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Title"
                      ),
                      initialValue: "",
                      onSaved: (val) => place.title_place = val,
                      validator: (val) => val == "" ? val : null,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.description),
                    title: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Discription"
                      ),
                      initialValue: "",
                      onSaved: (val) => place.discription_place = val,
                      validator: (val) => val == "" ? val : null,
                    ),
                  ),
                  FlatButton(
                    onPressed: getImage,
                    child: Icon(
                      Icons.image,
                      color: Colors.white,
                    ),

                    color: Colors.green,
                  ),
                  Text("OR")
                  ,
                  FlatButton(
                    onPressed: getPhoto,
                    child: Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                    color: Colors.green,
                  ),
                  FlatButton(
                    onPressed: sendData,
                    child: Text("send"),
                    color: Colors.pink,
                  ),
                  sampleImage == null ? Text('Select an image') : null,
                ],
              ),
            )),]
        ),
        actions: <Widget>[
          MaterialButton(
            child: Text("Add"),
            onPressed: () => Navigator.push(
            context,
      MaterialPageRoute(builder: (context) => addPlace()),
          )

          )
        ],
      );
    });
  }


  void _onEntryAdd(Event event) {
    setState(() {
      place_liste.add(Place.fromSnapshot(event.snapshot));
    });
  }

  void sendData() {
    final FormState form = formkey.currentState ;
    if (form.validate()){
      form.save() ;
      form.reset();
      databasereference.push().set(place.toJason()) ;
    }
  }
  _addmarker() {
    createAlertDialog(context);
    var marker = MarkerOptions(
        position: mapController.cameraPosition.target,
        icon: BitmapDescriptor.defaultMarker,
        infoWindowText: InfoWindowText('Place title','kjhrhdf'),
    );
    mapController.addMarker(marker);
    print('marker add !');
  }

}
