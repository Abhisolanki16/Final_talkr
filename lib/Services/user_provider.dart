import 'dart:io';

import 'package:provider/provider.dart';
import 'package:talkr_demo/Services/AuthMethods.dart';
import 'package:talkr_demo/Services/user2.dart';
import 'package:flutter/material.dart';


class UserProvider with ChangeNotifier{
   User2? _user ;
  final AuthMethods _authMethods = AuthMethods();
  
  User2 get getUser => _user!;
  Future<void> refreshUser() async{
    User2 user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
  

}
