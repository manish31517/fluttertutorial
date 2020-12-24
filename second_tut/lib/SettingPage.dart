import 'package:flutter/material.dart';
import 'package:second_tut/main.dart';
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCodeOnly(),
      appBar: new AppBar(
        title: new Text("Setting Page"),
      ),
      body: new Text("hey i am setting page body"),
    );
  }
}
