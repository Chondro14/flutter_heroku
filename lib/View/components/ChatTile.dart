import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/theme.dart';

class ChatTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){Navigator.pushNamed(context, '/detail-chat');},
      child: Container(
        margin: EdgeInsets.only(top: 13),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/logoshop.png',
                  width: 54,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoes Store',
                        style: primaryTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        'Mau beli ini pak?',maxLines: 2,overflow: TextOverflow.ellipsis,
                        style: secondaryTextStyle.copyWith(fontWeight: light),
                      )
                    ],
                  ),
                ),
                Text('Now',style: secondaryTextStyle.copyWith(fontSize: 10),)
              ],
            ),SizedBox(height: 12,),Divider(thickness: 2,color: Color(0xff282939),)
          ],
        ),
      ),
    );
  }
}
