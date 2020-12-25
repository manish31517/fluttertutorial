import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
// _________________________Row and Column Widget___________________________________
/*
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home:new  Scaffold(
      appBar: new AppBar(
        title: new Icon(Icons.queue_play_next),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: new Container(
        padding: new EdgeInsets.all(30.0),
        child: new Center(
          child: Column(
            children: <Widget>[
              new Text(
                "Login",
                style: TextStyle(fontSize: 30.0, color: Colors.green),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Row(
                  children: <Widget>[
                    new Icon(Icons.email),
                    Expanded(child: new TextField(
                      decoration: new InputDecoration(hintText: "Email...."),
                    ) )

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Row(
                  children: <Widget>[
                    new Icon(Icons.enhanced_encryption),
                    Expanded(child: new TextField(
                      obscureText: true,
                      decoration: new InputDecoration(hintText: "Password.."),
                    ))

                  ],
                ),
              ),
              new RaisedButton(onPressed: (){},
              child: new Text("Signin",style: TextStyle(fontSize:15.0,color: Colors.white),),
                color: Colors.green,
              )
            ],
          )
        ),
      ),
    ));
  }
}*/

//________________________________Static List View__________________________________

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
   debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text("Static ListView"),

        ),
        body: ListViewExample(),
      ),
    );
  }
}

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: ListTile.divideTiles(
          context: context,
          tiles: [
        ListTile(
          leading: Icon(Icons.directions_car),
          title: Text("Car"),
          subtitle: Text("Car is need of human"),
          onTap: ()
          {
            print('car');































            
          },
        ),
        ListTile(
          leading: Icon(Icons.bluetooth),
          title: Text("Bluetooth"),
          subtitle: Text("Bluetooth is on"),
        ),
        ListTile(
          leading: Icon(Icons.wifi),
          title: Text("Car"),
        )

      ]).toList()
/*      children: <Widget>[
        ListTile(
          leading: Icon(Icons.directions_car),
          title: Text("Car"),
        ),
        ListTile(
          leading: Icon(Icons.bluetooth),
          title: Text("Bluetooth"),
        ),
        ListTile(
          leading: Icon(Icons.wifi),
          title: Text("Car"),
        )

      ],*/
    );
  }
}

