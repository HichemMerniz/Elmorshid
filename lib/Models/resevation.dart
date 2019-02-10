import 'package:elmorshid/Models/user.dart';
import 'package:firebase_database/firebase_database.dart';

class reservation extends user{
  String id_reservation ;
  String id_place ;
  double prix ;
  DateTime date_resrv  ;
  DateTime date_fin  ;
  String place_dist ;

  reservation(this.prix) : super(this.first_name, this.seconde_name,this.email, this.username);
}