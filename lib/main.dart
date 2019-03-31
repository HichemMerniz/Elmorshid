import 'package:flutter/material.dart';
import 'package:elmorshid/Ui/Home.dart';
import 'package:elmorshid/Auth/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_storage/firebase_storage.dart';



void main() {

    return runApp(
        new MaterialApp(
          home: _handleCurrentScreen(),
          title: 'Elmorchid',
        )
    );

}

Widget _handleCurrentScreen() {
  return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return new SplashScreen(
              seconds: 14,
              navigateAfterSeconds: new Login(),
              title: new Text('Welcome In El Morshid'),
              image: new Image.asset('assets/img/logo.png'),
              backgroundColor: Colors.white,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 100.0,
              loaderColor: Colors.red
          );
        } else {
          if (snapshot.hasData) {
            return new Home ();

          }
          return new Login();
        }

      }

  );
}