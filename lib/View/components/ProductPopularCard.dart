import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/theme.dart';

class ProductPopularCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        width: 214,
        height: 278,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
            color: Color(0xffECEDEF), borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/sepatuhiking.png',
              width: 215,
              height: 150,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hiking',
                      style: secondaryTextStyle,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'COURT VISION 2.0',
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                      overflow: TextOverflow.ellipsis,
                    ),SizedBox(height: 6,),
                    Text('\$56,67',style: priceTextStyle.copyWith(fontSize: 14,fontWeight: medium),)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
