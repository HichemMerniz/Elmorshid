import 'package:flutter/material.dart';

class Map extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return mapState();
  }

}


class mapState extends State<Map>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Map') ,
        backgroundColor: Colors.deepPurple,

        iconTheme: IconThemeData(

        ),

      ),
    );

  }

}