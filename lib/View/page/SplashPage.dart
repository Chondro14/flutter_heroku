import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laravel_heroku/providers/ProductProvider.dart';
import 'package:laravel_heroku/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit()async{
    await Provider.of<ProductProvider>(context,listen: false).getProducts();
   Navigator.pushNamed(context, '/sign-in');

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage('assets/Unionlogoapp.png'))),
        ),
      ),
    );
  }
}
