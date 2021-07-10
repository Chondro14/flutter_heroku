import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laravel_heroku/View/components/ChatBubble.dart';
import 'package:laravel_heroku/theme.dart';

class DetailChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    PreferredSizeWidget header() {
      return PreferredSize(
          child: AppBar(
            backgroundColor: backgroundColor1,
            centerTitle: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/logoshop.png',
                      width: 48,
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 6,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shoes Store',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                    Text(
                      '12 Minutes ago',
                      style: secondaryTextStyle.copyWith(
                          fontWeight: light, fontSize: 14),
                    )
                  ],
                ))
              ],
            ),
          ),
          preferredSize: Size.fromHeight(90));
    }

    Widget productReview() {
      return Container(
        width: 225,
        height: 74,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primary)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/sepatuhiking.png',
                  width: 54,
                )),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TERREX TRAILMAKER HIKING SHOES",
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$57,15',
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ),
            Container(
              width: 20,
              height: 20,
              child: Icon(
                Icons.close_rounded,
                color: backgroundColor5,
                size: 12,
              ),
              decoration: BoxDecoration(shape: BoxShape.circle, color: primary),
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            productReview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: backgroundColor4,
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Type message....",
                            hintStyle: subtitleTextStyle),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/sendbutton.png',
                  width: 45,
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          ChatBubble(
            text: "Hallo Selamat pagi, ada yang bisa saya bantu?",
            isSender: false,
            hasProduct: false,
          ),
          ChatBubble(
            text: "Mau Beli ini pak ?",
            isSender: true,
            hasProduct: true,
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
