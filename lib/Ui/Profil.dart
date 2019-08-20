import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Profil extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new profilState();
  }

}
class profilState extends State<Profil>{


  AsyncSnapshot<FirebaseUser> snapshot;
  final FirebaseDatabase database = FirebaseDatabase();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

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

      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.deepPurpleAccent,

            ),
            clipper: getClipper(),
          ), 
          Positioned(
              width: 390.0,
              top:MediaQuery.of(context).size.height/4 ,
              child:Column(
                children: <Widget>[
                  FutureBuilder(
                    future: FirebaseAuth.instance.currentUser(),
                    builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 150.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(snapshot.data.photoUrl),
                              fit: BoxFit.none
                            ),

                            borderRadius: BorderRadius.all(Radius.circular(80.0),
                            ),
                            color: Colors.white,
                            boxShadow: [BoxShadow(blurRadius: 17.0 , color: Colors.black)]
                          ),

                        );

                      }
                      else {
                        return CircleAvatar(
                          backgroundImage: AssetImage("assets/img/man.png"),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 20.0,),
                  FutureBuilder(
                    future: FirebaseAuth.instance.currentUser(),
                    builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data.displayName.toString(),
                          style: TextStyle(
                           fontSize: 30.0,
                           fontFamily: 'Lexend Deca',
                           fontWeight: FontWeight.bold
                          )
                        );


                      }
                    },
                  ),
                  FutureBuilder(
                    future: FirebaseAuth.instance.currentUser(),
                    builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                            snapshot.data.email.toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.normal
                            )
                        );
                      }
                    },
                  ),
                ],
              )
          )
          
        ],
      )

    );
  }
}
class getClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height/1.9);
    path.lineTo(size.width+125, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }


}