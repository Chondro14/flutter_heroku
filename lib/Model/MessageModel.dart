import 'package:laravel_heroku/Model/ProductModel.dart';

class MessageModel{
  String? message;
  int? userId;
  String? userName;
  String? userImage;
  bool? isFromUser;
  ProductModel? productModel;
  DateTime? createdAt;
  DateTime? updatedAt;

  MessageModel(this.message,this.productModel,this.createdAt,this.isFromUser,this.updatedAt,this.userId,this.userImage,this.userName);


  MessageModel.fromJson(Map<String,dynamic> json){
    message = json['message'];
    userId = json['userId'];
    userName = json['userName'];
    userImage = json['userImage'];
    isFromUser = json['isFromUser'];
    productModel = json['product'] == {} ? UninitializedProductModel() : ProductModel.fromJson(json['product']);
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['update_at']);

  }

  Map<String,dynamic> toJson(){
    return{
      'message':message,
      'userId':userId,
      'userName':userName,
      'userImage':userImage,
      'isFromUser':isFromUser,
      'product':productModel is UninitializedProductModel ?{} :productModel!.toJson(),
      'created_at':createdAt.toString(),
      'update_at':updatedAt.toString()
    };
  }
}