import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new stateHome();
  }

}


class stateHome extends State<Home>{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.deepPurple ,
      appBar: new AppBar(
        title: new Text(
            'Elmorshid'
        ),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: new BottomNavigationBar(items:[
        new BottomNavigationBarItem(icon: new Icon(Icons.home),title: new Text('home'),),
        new BottomNavigationBarItem(icon: new Icon(Icons.place),title: new Text('place'),),
        new BottomNavigationBarItem(icon: new Icon(Icons.hotel),title: new Text('reservation'),),
        new BottomNavigationBarItem(icon: new Icon(Icons.map),title: new Text('map'),),
      ],
        fixedColor: Colors.black54,
      ),
      drawer: new Drawer(
        child: new Center(
            child: new Column(
              children: <Widget>[
                new ListView(
                  padding: const EdgeInsets.all(32.2),
                  children: <Widget>[
                    new Text('Mounir')
                  ],
                )
              ],

            )
        ),
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
              Image.network(
                'https://t-ec.bstatic.com/xdata/images/hotel/max500/163496958.jpg?k=565fdeef7141cc544d4bcfe314568fcc8cd75b6f17b68c1449794f4e0f256f9a&o=',
                fit: BoxFit.fill,
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