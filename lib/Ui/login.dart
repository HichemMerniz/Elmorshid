import 'package:flutter/material.dart';
import 'inscrir.dart';
class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    //  MapView.setApiKey(mykey);
    // TODO: implement createState
    return loginState();
  }

}
class loginState extends State<Login> {
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


    final loginButton = Padding(
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
            child: Text('Log In',style: TextStyle(color: Colors.white,fontSize: 20.0),),

        ),
      ),
    );


    final inscription = FlatButton(
      child: Text('Iscrivez-Vous !',style: TextStyle(color: Colors.deepPurple),),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Inscrir()),
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
              username,
              SizedBox(height: 15.0),
              password,
              SizedBox(height: 15.0),
              loginButton,
              inscription
            ],
          ),
        ),
    );
  }
}