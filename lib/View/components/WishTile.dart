import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/theme.dart';

class WishTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, right: 20, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/sepatuhiking.png',
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TERREX TRAILMAKER HIKING SHOES",overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),maxLines: 2,
                ),
                Text(
                  "\$143,98",
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: secondaryColor),
            child: Icon(Icons.favorite,color: Colors.white,size: 16,)
          )
        ],
      ),
    );
  }
}
