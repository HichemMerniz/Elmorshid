import 'package:flutter/material.dart';
import 'package:elmorshid/Ui/Map.dart';
import 'package:elmorshid/Ui/addVoyage.dart';
import 'package:elmorshid/Ui/addPlace.dart';
import 'package:elmorshid/Ui/Profil.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new stateHome();
  }

}


class stateHome extends State<Home>{

  int _cIndex = 0;
//
//  void _incrementTab(index) {
//    setState(() {
//      _cIndex = index;
//    });
//  }




  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      backgroundColor: Colors.deepPurple ,
      appBar: new AppBar(
        title: new Text(
            'Elmorshid'
        ),
        backgroundColor: Colors.deepPurple,
      ),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex:  _cIndex,

          items:[
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
        onTap:(index)=> Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Map()),
        ),



      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Hichem Merniz"),
              accountEmail: Text("Hichembba97@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                Theme.of(context).platform == TargetPlatform.iOS
                    ? Colors.deepPurple
                    : Colors.white,
                child: Text(
                  "H",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            
            ListTile(
              title: Text("Add voyage"),
              onTap:() => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addVoyage()),
              ),
              trailing: Icon(Icons.add_circle,color: Colors.deepPurple,),
            ),
            ListTile(
              title:Text('Profil') ,
              trailing:Icon(Icons.person,color: Colors.deepPurple,) ,
              onTap:() => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profil()),
              ),
            ),
            ListTile(
              title: Text("Add place"),
              trailing: Icon(Icons.add_location,color: Colors.deepPurple,),
              onTap:() => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addPlace()),
              ),

            ),
          ],
        ),

      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: null
      ),
      body: new Container(

        child: Card(
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
//              Image.network(
//                'https://t-ec.bstatic.com/xdata/images/hotel/max500/163496958.jpg?k=565fdeef7141cc544d4bcfe314568fcc8cd75b6f17b68c1449794f4e0f256f9a&o=',
//                fit: BoxFit.fill,
//              ),
            Image.asset(
              'assets/img/test.jpg',
              fit: BoxFit.cover,
            ),
              const ListTile(
                leading: Icon(Icons.visibility),
                title: Text('Place1'),
                subtitle: Text('Discription of place 1 .'),
              ),
              ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () { /* ... */ },
                    ),
                    FlatButton(
                      child: const Text('Visit'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}