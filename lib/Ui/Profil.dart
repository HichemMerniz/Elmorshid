import 'package:flutter/material.dart';


class Profil extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new profilState();
  }

}
class profilState extends State<Profil>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Profil'),
        )

    );
  }
}