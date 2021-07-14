import 'package:flutter/material.dart';
import 'package:laravel_heroku/Model/ProductModel.dart';
import 'package:laravel_heroku/service/ProductService.dart';

class ProductProvider with ChangeNotifier{
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  set products(List<ProductModel> products){
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts()async{
    try{
      List<ProductModel> productse = await ProductService().getProducts();
      _products = productse;

    }
    catch(e){
      print(e);
    }
  }
}