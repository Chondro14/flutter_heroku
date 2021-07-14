import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/Model/ProductModel.dart';
import 'package:laravel_heroku/View/page/ProductPage.dart';
import 'package:laravel_heroku/theme.dart';

class ProductPopularCard extends StatelessWidget {

   ProductModel product;
  ProductPopularCard({required this.product});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage(product: product)));
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
            Image.network(
              product.galleries?[0].url ?? "https://cf.shopee.co.id/file/50ba0b3840732bc949f759efc0fc2ba7",
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
                      product.category?.name ?? "bebas",
                      style: secondaryTextStyle,

                    ),
                    SizedBox(height: 6),
                    Text(
                      product.name ?? "",
                      maxLines: 1,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                      overflow: TextOverflow.ellipsis,
                    ),SizedBox(height: 6,),
                    Text("\$${product.price}",style: priceTextStyle.copyWith(fontSize: 14,fontWeight: medium),)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
