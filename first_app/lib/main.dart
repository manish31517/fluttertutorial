import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FirstApp());
}
class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color= Colors.blue;
    Widget titleSection = Container(
      padding:const EdgeInsets.all(33),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
              children: [
                Container(
                  padding:const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Google Head Quarters",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textDirection: TextDirection.ltr,
                  ),
                ),
                Text(
                  'mountain View, Calfornia, United States',
                  style: TextStyle(color: Colors.grey[505]),
                  textDirection: TextDirection.ltr,
                )
              ],
              )),
          new Icon(
            Icons.star,
            color: Colors.red,
          ),
         Text('41')
        ],
      ),
    );
    Column _buildbuttonColumn(Color color, IconData icon, String label)
    {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color
              ),
            ),
          )

        ],
      );
    }
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildbuttonColumn(color,Icons.call,'CALL'),
          _buildbuttonColumn(color,Icons.near_me,'CALL'),
          _buildbuttonColumn(color,Icons.share,'CALL'),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        "Silicon Valley is a region in the southern part of the San Francisco Bay Area in Northern California that serves as a global center for high technology and innovation.It corresponds roughly to the geographical Santa Clara Valley",
            softWrap: true,
            textAlign: TextAlign.justify,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Googleplex'),
        ),
        body:ListView(
          children:[
             Image.asset(
               'images/google.jpg',
                   width:600,
                 height: 241,
               fit: BoxFit.cover,
             ),
             titleSection,
            buttonSection,
            textSection
          ]
        ),
      ),
    );
  }
}


