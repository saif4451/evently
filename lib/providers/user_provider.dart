import 'package:evently/model/my_user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  MyUser? CurrenUser;
  void updateUser(MyUser newUser){
    CurrenUser=newUser;
    notifyListeners();

  }
}