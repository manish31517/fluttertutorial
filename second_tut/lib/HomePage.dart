import 'package:flutter/material.dart';
import 'package:second_tut/main.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: DrawerCodeOnly(),
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: new Text("hey i am home page body"),
    );
  }
}
