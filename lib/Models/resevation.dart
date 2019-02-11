import 'package:elmorshid/Models/user.dart';

class resrvation extends user {

  String id_resrvation ;
  String id_place ;
  double prix ;
  DateTime date_resrv;
  DateTime date_fin;
  double place_distence ;


  resrvation(String this.id_resrvation ,String first_name, String seconde_name, String email, String username) : super(first_name, seconde_name, email, username);

}