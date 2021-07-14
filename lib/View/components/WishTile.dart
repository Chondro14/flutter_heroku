import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/Model/ProductModel.dart';
import 'package:laravel_heroku/providers/WishListProvider.dart';
import 'package:laravel_heroku/theme.dart';
import 'package:provider/provider.dart';

class WishTile extends StatelessWidget {

  ProductModel product;

  WishTile({required this.product});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);
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
            child: Image.network(
              product.galleries?[0].url??"",
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
                  product.name ?? "",overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),maxLines: 2,
                ),
                Text(
                  " \$ ${product.price}",
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              wishListProvider.setProduct(product);
            },
            child: Container(
              width: 32,
              height: 32,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: secondaryColor),
              child: Icon(Icons.favorite,color: Colors.white,size: 16,)
            ),
          )
        ],
      ),
    );
  }
}
