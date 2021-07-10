import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laravel_heroku/theme.dart';

class CartTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage('assets/sepatuhiking.png'))),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TERREX TRAILMAKER HIKING SHOES',
                    style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  Text(
                    '\$143,98',
                    style: priceTextStyle,
                  )
                ],
              )),
              Column(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: primary),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 10,
                    ),
                  ),
                  Text(
                    '2',
                    style: primaryTextStyle,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: subtitleColor),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 10,
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.restore_from_trash,
                    color: alertColor,
                  )),
              Text('Remove',style: GoogleFonts.poppins(color: alertColor),)
            ],
          )
        ],
      ),
    );
  }
}
