import 'package:flutter/material.dart';
import 'package:second_tut/HomePage.dart';
import 'package:second_tut/ReviewsPage.dart';
import 'package:second_tut/SettingPage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home : MyDrawerApp(),
    );
  }
}
class MyDrawerApp extends StatefulWidget {
  @override
  _MyDrawerAppState createState() => _MyDrawerAppState();
}

class _MyDrawerAppState extends State<MyDrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCodeOnly(),
      appBar: new AppBar(
        title: new Text("Drawer"),

      ),
      body: new Text("Hey this is the body"),
    );
  }
}
class DrawerCodeOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new  DrawerHeader(child: Text("My Drawer header"),
            decoration: new BoxDecoration(
              color: Colors.green,
            ),
          ),
          new ListTile(
            title: new Text("Home Page"),
            onTap: (){
              Navigator.pop(context);
              
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage() ));
            },
          ),
          new ListTile(
            title: new Text("Review Page"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new ReviewPage() ));
            },
          ),
          new ListTile(
            title: new Text("Setting Page"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new SettingPage() ));
            },
          )
        ],
      ),
    );
  }
}
