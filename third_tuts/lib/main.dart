import 'package:flutter/material.dart';
import 'package:third_tuts/Homepage.dart';
import 'package:third_tuts/SettingPage.dart';
import 'package:third_tuts/contactPage.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavigatioBar()
    );
  }
}

class MyBottomNavigatioBar extends StatefulWidget {
  @override
  _MyBottomNavigatioBarState createState() => _MyBottomNavigatioBarState();
}

class _MyBottomNavigatioBarState extends State<MyBottomNavigatioBar> {
int _currentIndex =0;
final List<Widget> _children =[HomePage(),SettingPage(),ContactPage()];
void onTappedBar(int index){
setState((){
 _currentIndex = index;
});
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       body : _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Home")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.settings),
              title: new Text("Settings")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.contacts),
              title: new Text("Contacts ")
          ),

        ],
      )
    );
  }
}

