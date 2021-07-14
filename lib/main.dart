import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/View/page/CartPage.dart';
import 'package:laravel_heroku/View/page/CheckoutPage.dart';
import 'package:laravel_heroku/View/page/CheckoutSuccesPage.dart';
import 'package:laravel_heroku/View/page/DetailChatPage.dart';
import 'package:laravel_heroku/View/page/EditProfilePage.dart';
import 'package:laravel_heroku/View/page/MainPage.dart';
import 'package:laravel_heroku/View/page/ProductPage.dart';
import 'package:laravel_heroku/View/page/SignInPage.dart';
import 'package:laravel_heroku/View/page/SignUpPage.dart';
import 'package:laravel_heroku/View/page/SplashPage.dart';
import 'package:laravel_heroku/providers/AuthProvider.dart';
import 'package:laravel_heroku/providers/ProductProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(create: (context)=>ProductProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          /*'/product': (context) => ProductPage(),*/
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccesPage()
        },
      ),
    );
  }
}
