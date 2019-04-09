import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:elmorshid/Models/place.dart';

class addPlace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new addpState();
  }
}

class addpState extends State<addPlace> {
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
                        onPressed: sendData,
                        child: Text("send"),
                        color: Colors.pink,
                    )
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
}
