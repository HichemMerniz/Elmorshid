import 'package:flutter/material.dart';
import 'package:elmorshid/Auth/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';






void main() {
  runApp(
    new MaterialApp(

    home: Login(),
    title: 'Elmorchid',
    )
  );
}