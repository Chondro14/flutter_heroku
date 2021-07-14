import 'package:flutter/material.dart';
import 'package:laravel_heroku/Model/CartModel.dart';
import 'package:laravel_heroku/service/TransactionService.dart';

class TransactionProvider with ChangeNotifier{
  Future<bool> checkout(String token,List<CartModel> carts,double totalprice)async{
    try{
      if(await TransactionService().checkout(token, carts, totalprice)){
        return true;
      }
      else {
        return false;
      }
    }
    catch(e){
      print(e);
      return false;
    }
  }
}