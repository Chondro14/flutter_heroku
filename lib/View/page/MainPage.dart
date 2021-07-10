import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/View/page/ChatPage.dart';
import 'package:laravel_heroku/View/page/FavoritePage.dart';
import 'package:laravel_heroku/View/page/HomePage.dart';
import 'package:laravel_heroku/View/page/ProfilePage.dart';
import 'package:laravel_heroku/theme.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  Widget test = HomePage();
  Widget body(int selected) {
    switch(selected){
      case 0:
        test = HomePage();
        return test;

      case 1:
        test = ChatPage();
        return test;

      case 2:
        test = FavoritePage();
            return test;

      case 3:
        test = ProfilePage();
        return test;
    }
    return test;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        child: Icon(
          Icons.shopping_bag,
          color: primaryTextColor,
        ),
      );
    }


    Widget customBottomNav() {

      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),

        child: BottomAppBar(

          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
              onTap: (value){
              print(value);
              setState(() {
                currentIndex = value;
              });
              },
              type: BottomNavigationBarType.fixed,

              backgroundColor: backgroundColor4,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20,bottom: 10),
                      child: Icon(
                        Icons.home,color: currentIndex == 0 ? primary:Colors.grey,
                      ),
                    ),label: ""
                    ),
                BottomNavigationBarItem(
                    icon: Container(margin: EdgeInsets.only(top: 20,bottom: 10,right: 20),child: Icon(Icons.chat_rounded,color: currentIndex == 1 ? primary:Colors.grey,)),label: ""),
                BottomNavigationBarItem(
                    icon: Container(margin: EdgeInsets.only(top: 20,bottom: 10,left:20),child: Icon(Icons.favorite,color: currentIndex == 2 ? primary:Colors.grey,)), label: ""),
                BottomNavigationBarItem(icon: Container(margin: EdgeInsets.only(top: 20,bottom: 10),child: Icon(Icons.person,color: currentIndex == 3 ? primary:Colors.grey,)), label: "")
              ]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: SafeArea(child: body(currentIndex),),
    );
  }
}
