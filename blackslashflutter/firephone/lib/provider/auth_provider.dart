import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthProvider extends ChangeNotifier {
  bool _isSignedIn=false;
  bool get isSignedIn => _isSignedIn;

  AuthProvider(){
    checkSignIn();
  }

  void checkSignIn() async{
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool('isSignedIn') ?? false;
    notifyListeners();
  }
  

  
}