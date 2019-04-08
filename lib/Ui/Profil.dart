import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Profil extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new profilState();
  }

}
final FirebaseDatabase database = FirebaseDatabase(); 
class profilState extends State<Profil>{


//   void read(){
//     setState(() {
//       database.reference().child("test").once().then(
//               (DataSnapshot snapshot){
//             Map<dynamic,dynamic> data = snapshot.value ;
//             print("value is db  : ${data.values}");
//           });
//     });
//
//   }



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