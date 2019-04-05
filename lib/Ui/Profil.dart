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

      body: CircleAvatar(

        child : new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/img/man.png"),
          ],
        ),
      ) ,

    );
  }
}