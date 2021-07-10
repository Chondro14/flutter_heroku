import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/Model/UserModel.dart';
import 'package:laravel_heroku/service/AuthService.dart';
class AuthProvider with ChangeNotifier{
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user){
    _user = user;
    notifyListeners();
  }

  Future<bool> register(String name,String username,String email,String password)async{
    try{
      UserModel user = await AuthService().register(name, username, email, password);

      _user = user;
      return true;
    }
    catch(e ){
      print(e);
      return false;
    }

  }
  Future<bool> login(String email,String password)async{
    try{
      UserModel user = await AuthService().login(email, password);

      _user = user;
      return true;
    }
    catch(e ){
      print(e);
      return false;
    }

  }


}