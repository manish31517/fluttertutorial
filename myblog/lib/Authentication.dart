import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
abstract class AuthImplementation{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> SignIn(String email, String password);
  Future<String> SignUp(String email, String password);
  Future<void> signOut();
  Future<String> getCurrentUser();
}
class Auth implements AuthImplementation{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> SignIn(String email, String password) async{
      UserCredential  user1 = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password));
    return user1.user.toString();
  }
  Future<String> SignUp(String email, String password) async{
    UserCredential  user1 = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password));
    return user1.user.toString();
  }
  Future<void> signOut() async{
    _firebaseAuth.signOut();
  }
  Future<String> getCurrentUser() async{
    FirebaseUser user = (await _firebaseAuth.currentUser) as FirebaseUser;
    return user.uid;
  }
}
