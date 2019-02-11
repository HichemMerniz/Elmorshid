import 'package:flutter/material.dart';


class addPlace extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new addpState();
  }

}
class addpState extends State<addPlace>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Add Place'),
        )
    );
  }
}