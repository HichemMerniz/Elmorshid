import 'dart:async';
import 'package:flutter/material.dart';
import 'package:elmorshid/Ui/Home.dart';
import 'inscrir.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //  MapView.setApiKey(mykey);
    // TODO: implement createState
    return loginState();
  }
}

class loginState extends State<Login> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'elmorshid',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/img/logo.png'),
      ),
    );

    //----------------------email_input---------------------------------

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (input) {},
      onSaved: (input) {},
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Email",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    //----------------------Password_input---------------------------------

    final password = TextFormField(
      obscureText: true,
      autofocus: false,
      validator: (input) {},
      onSaved: (input) => _password = (input),
      decoration: InputDecoration(
        hintText: "Password",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    //----------------------Login_button---------------------------------

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.deepPurple.shade100,
        elevation: 5.0,
        child: MaterialButton(
          //onPressed: () => login(),
          minWidth: 200.0,
          height: 42.0,
          color: Colors.deepPurple,
          child: Text(
            'Log In',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );

    //----------------------Google_button---------------------------------

    final googleButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.deepPurple.shade100,
        elevation: 5.0,
       child: GoogleSignInButton(onPressed: () => _gSignin()),
      ),
    );

    //----------------------insecription---------------------------------

    final inscription = FlatButton(
      child: Text(
        'Iscrivez-Vous !',
        style: TextStyle(color: Colors.deepPurple),
      ),
      onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Inscrir()),
          ),
    );

    //----------------------MAIN---------------------------------

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 30.0),
            email,
            SizedBox(height: 15.0),
            password,
            SizedBox(height: 15.0),
            loginButton,
            googleButton,

          ],
        ),
      ),
    );
  }

//-----------------------------login_function-----------------------------------



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
    return user;
  }

}
