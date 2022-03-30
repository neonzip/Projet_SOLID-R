import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppUser {
  final String uid;
  AppUser({required this.uid});
}

class AuthentificationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AppUser? _userFromFireBaseUser(User? user)
  {
    return user != null ? AppUser(uid : user.uid) : null;
  }

  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFireBaseUser);
  }
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFireBaseUser(user);
    } catch(exception) {
      print(exception.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(exception) {
      print(exception.toString());
      return null;
    }
  }
}