import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laravel_heroku/Model/MessageModel.dart';
import 'package:laravel_heroku/Model/ProductModel.dart';
import 'package:laravel_heroku/Model/UserModel.dart';

class MessageService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesUserid(int userId){
    try{
      firestore.collection('messages').where('userId',isEqualTo: userId).snapshots().map((QuerySnapshot event) {
        var result = event.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          print(message.metadata);
          return MessageModel.fromJson(message.data());
  }).toList();

  result.sort((MessageModel a,MessageModel b) => a.createdAt!.compareTo(b.createdAt!));

  return result;
      });


    }
    catch(e){
      throw Exception(e);
    }
  }

  Future<void> addMessage(UserModel user,bool isFromUser,String message,ProductModel productModel)async{

    try{
      firestore.collection("messages").add({
        'userId':user.id,
        'userName':user.name,
        'userImage':user.profilePhotoUrl,
        'isFromUser':isFromUser,
        'message':message,
        'product':productModel is UninitializedProductModel ? {} : productModel.toJson(),
        'createdAt':DateTime.now().toString(),
        'updatedAt':DateTime.now().toString()
      }).then((value) => print('Pesan berhasil Dikirim'));
    }catch(e){
      throw Exception('Gagal');
    }

  }
}