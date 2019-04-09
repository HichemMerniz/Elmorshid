import 'package:flutter/material.dart';
import 'package:elmorshid/Ui/Map.dart';
import 'package:elmorshid/Ui/addVoyage.dart';
import 'package:elmorshid/Ui/addPlace.dart';
import 'package:elmorshid/Ui/Profil.dart';
import 'package:elmorshid/Ui/Place_Avitivity.dart';
import 'package:elmorshid/Models/place.dart';
import 'package:elmorshid/Auth/Login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:elmorshid/Ui/Reservation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new stateHome();
  }
}

final _user = new Login();

class stateHome extends State<Home> {

  List<Place> place_liste = List() ;
  Place place ;
  final FirebaseDatabase database = FirebaseDatabase();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>() ;
  DatabaseReference databasereference ;

  @override
  void initState(){
    super.initState();
    place = new Place("","");
    databasereference = database.reference().child("places");
    databasereference.onChildAdded.listen(_onEntryAdd) ;
  }

  int _cIndex = 0;

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

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();


  Future<FirebaseUser> _gSignin() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
    FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          database.reference().child("Userrs").set({
            "name" :snapshot.data.displayName,
            "email": snapshot.data.email,
            "tel" : snapshot.data.phoneNumber,
          });
        }

      },
    );
    return user;
  }

  @override
  Widget build(BuildContext context) {
    var user = new stateHome();


    void _setMessage(){

            database.reference().child("Userrs").set({
              "name" :"Hichem",
              "email": "Hichembba97@gmail.com",
            });



    }

    return new Scaffold(
      backgroundColor: Colors.deepPurple,

      appBar: new AppBar(
        title: new Text('Elmorshid'),
        backgroundColor: Colors.deepPurple,
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
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
         accountName: FutureBuilder(
                future: FirebaseAuth.instance.currentUser(),
                builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.displayName);
                  }
                  else {
                    return Text('Loading...!!!');
                  }
                },
              ),

              accountEmail: FutureBuilder(
                future: FirebaseAuth.instance.currentUser(),
                builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.email);
                  }
                  else {
                    return Text('Loading...!!');
                  }
                },
              ),

              currentAccountPicture: FutureBuilder(
                future: FirebaseAuth.instance.currentUser(),
                builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                  if (snapshot.hasData) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data.photoUrl) ,
                    );
                  }
                  else {
                    return CircleAvatar(
                      backgroundImage: AssetImage("assets/img/man.png"),
                    );
                  }
                },
              ),
            ),
            ListTile(
              title: Text("Add voyage"),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => addVoyage()),
                  ),
              trailing: Icon(
                Icons.add_circle,
                color: Colors.deepPurple,
              ),
            ),

            ListTile(
              title: Text('Profil'),
              trailing: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profil()),
                  ),
            ),
            ListTile(
              title: Text("Add place"),
              trailing: Icon(
                Icons.add_location,
                color: Colors.deepPurple,
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => addPlace()),
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: _setMessage ,
        child: Icon(Icons.add_box , color: Colors.white)
      ),

     body:Column(
       children: <Widget>[
         Flexible(
             child: FirebaseAnimatedList(
                 query: databasereference,
                 itemBuilder: (_,DataSnapshot snapshot,Animation<double> animation , int index){
                   return new Card(
                     semanticContainer: true,
                     clipBehavior: Clip.antiAliasWithSaveLayer,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10.0),
                     ),
                     elevation: 5,
                     margin: EdgeInsets.all(10),
                     color: Colors.white,
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget>[
                         Image.asset(
                           "assets/img/test.jpg",
                           fit: BoxFit.cover,
                         ),
                         ListTile(
                           leading: Icon(Icons.visibility),
                           title: Text(place_liste[index].title_place),
                           subtitle: Text(place_liste[index].discription_place),
                         ),
                         ButtonTheme.bar(
                           // make buttons use the appropriate styles for cards
                           child: ButtonBar(
                             children: <Widget>[
                               FlatButton(
                                 child: const Text('BUY TICKETS'),
                                 onPressed: () {
                                   /* ... */
                                 },
                               ),
                               FlatButton(
                                 child: const Text('Visit'),
                                 onPressed: () {
                                   /* ... */
                                 },
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   );
                 }
             )
         )
       ],
     )


    );

  }

  void _onEntryAdd(Event event) {
    setState(() {
      place_liste.add(Place.fromSnapshot(event.snapshot));
    });
  }
}
