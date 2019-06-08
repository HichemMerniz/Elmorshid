import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:elmorshid/Models/place.dart';
import 'package:image_picker/image_picker.dart';

class addPlace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new addpState();
  }
}

class addpState extends State<addPlace> {

  File sampleImage;

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      sampleImage = tempImage;
    });
  }


  List<Place> place_liste = List();
  Place place;
  final FirebaseDatabase database = FirebaseDatabase();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  DatabaseReference databasereference;
  @override
  void initState(){
    super.initState();
    place = new Place("","");
    databasereference = database.reference().child("places");
    databasereference.onChildAdded.listen(_onEntryAdd) ;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Add Place'),
      ),
      body: Column(
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

                    FlatButton(
                        onPressed: sendData,
                        child: Text("send"),
                        color: Colors.pink,
                    ),
                    sampleImage == null ? Text('Select an image') : enableUpload(),
                  ],
                ),
              ))
        ],
      ),
    );
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

  Widget enableUpload() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(sampleImage, height: 300.0, width: 300.0),
          RaisedButton(
            elevation: 7.0,
            child: Text('Upload'),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
              final StorageReference firebaseStorageRef =
              FirebaseStorage.instance.ref().child('image upload');
              final StorageUploadTask task =
              firebaseStorageRef.putFile(sampleImage);

            },
          )
        ],
      ),
    );
  }

}
