import 'package:flutter/material.dart';
import 'package:laravel_heroku/Model/CartModel.dart';
import 'package:laravel_heroku/Model/ProductModel.dart';

class CartProvider with ChangeNotifier{
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;
  
  set carts(List<CartModel> carts){
    _carts = carts;
    notifyListeners();
  }
  
  addCart(ProductModel productModel){
    if(productExist(productModel)){
      int index = _carts.indexWhere((element) => element.product?.id == productModel.id);
      int mantap = 1;
      mantap++;
      _carts[index].quantity = mantap;
    }else{
      _carts.add(CartModel(id: _carts.length,product: productModel,quantity: 1));
    }
    notifyListeners();
  }

  removeCart(int id){
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id){
    _carts[id].quantity = _carts[id].quantity! + 1;
    notifyListeners();
  }

  reduceQuantity(int id){

    _carts[id].quantity = _carts[id].quantity! - 1;
    notifyListeners();

    if(_carts[id].quantity == 0){
      _carts.removeAt(id);
    }

  }

  totalItems(){
    int total = 0;
    for(var item in _carts){
      total += item.quantity!;

    }
    return total;
    notifyListeners();
  }

  totalPrice(){
    double total = 0.0;
    for(var item in _carts){

      total += ( item.quantity!.toDouble()  * (item.product?.price as num)  );
    }
    return total;
    notifyListeners();
  }

  
  productExist(ProductModel product){
    if(_carts.indexWhere((element) => element.product?.id == product.id) == -1){
      return false;
    }
    else{
      return true;
    }
  }
}
