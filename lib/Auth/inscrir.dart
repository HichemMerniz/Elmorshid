import 'package:flutter/material.dart';
import 'package:elmorshid/Auth/Login.dart';



class Inscrir extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    //  MapView.setApiKey(mykey);
    // TODO: implement createState
    return inscrirState();
  }

}
class inscrirState extends State<Inscrir> {
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


    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Votre email",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );


    final username = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Nom d'utilisateur",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );


    final password = TextFormField(
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Mot de passe",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );


    final inscrirButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.deepPurple.shade100,
        elevation: 5.0,
        child: MaterialButton(

            onPressed: (){ },
            minWidth: 200.0,
            height: 42.0,
            color: Colors.deepPurple,
            child: Text('Inscrir',style: TextStyle(color: Colors.white,fontSize: 20.0),),

        ),
      ),
    );


    final loginButton = FlatButton(
      child: Text('Log In !',style: TextStyle(color: Colors.deepPurple),),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      ),
    );


    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0,right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 30.0),
              email,
              SizedBox(height: 15.0),
              username,
              SizedBox(height: 15.0),
              password,
              SizedBox(height: 15.0),
              password,
              SizedBox(height: 15.0),
              inscrirButton,
              loginButton
            ],
          ),
        ),
    );
  }
}