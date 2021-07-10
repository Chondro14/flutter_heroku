import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:laravel_heroku/theme.dart';

class TextFieldCustomDevice extends StatelessWidget{
  TextEditingController controller;
  String hint;
  bool obsecureText ;
  TextFieldCustomDevice({required this.controller,required this.hint,required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS){
      return CupertinoTextField(style: primaryTextStyle,controller: controller,decoration: BoxDecoration(),placeholder: hint,placeholderStyle: subtitleTextStyle,obscureText:obsecureText,);
    }
    else{
      return TextFormField(style: primaryTextStyle,controller: controller,decoration: InputDecoration(hintText: hint,hintStyle: subtitleTextStyle),obscureText: obsecureText,);
    }
  }
}