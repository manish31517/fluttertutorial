 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myblog/Authentication.dart';
import 'package:myblog/HomePage.dart';
import 'package:myblog/loginregister.dart';
import 'package:myblog/mapping.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlogApp());
}

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme : new ThemeData(
        primarySwatch: Colors.pink,
      ),
        home: MappingPage(auth: Auth(),),
    );
  }
}
