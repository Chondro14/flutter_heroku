import 'package:flutter/material.dart';
import 'package:laravel_heroku/Model/ProductModel.dart';

class WishListProvider with ChangeNotifier{
  List<ProductModel> _wishlist = [];
  List<ProductModel> get wishlist => _wishlist;

  set wishlist(List<ProductModel> wishlist){
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel productModel){
    if(!isWishlist(productModel)){
      _wishlist.add(productModel);
    }else{
      _wishlist.removeWhere((element) => element.id == productModel.id);
    }

    notifyListeners();
  }

  isWishlist(ProductModel productModel){
    if(_wishlist.indexWhere((element) => element.id == productModel.id) == -1){
      return false;
    }
    else{
      return true;
    }
  }
}