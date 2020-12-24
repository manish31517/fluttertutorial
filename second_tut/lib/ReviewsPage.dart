import 'package:flutter/material.dart';
import 'package:second_tut/main.dart';
class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCodeOnly(),
      appBar: new AppBar(
        title: new Text("Review Page"),
      ),
      body: new Text("hey i am review page body"),
    );
  }
}
