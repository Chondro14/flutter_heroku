import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/theme.dart';

class CheckoutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
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
                style: primaryTextStyle.copyWith(fontWeight: semiBold),overflow: TextOverflow.ellipsis,maxLines: 2,
              ),SizedBox(height: 2,),
              Text('\$143,98',style: priceTextStyle,)
            ],
          )),
          Text('2 Items',style: secondaryTextStyle.copyWith(fontSize: 12),)
        ],
      ),
    );
  }
}
