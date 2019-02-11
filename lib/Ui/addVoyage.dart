import 'package:flutter/material.dart';


class addVoyage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new addvState();
  }

}
class addvState extends State<addVoyage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Add Voyage'),
      ),

    );
  }
}


