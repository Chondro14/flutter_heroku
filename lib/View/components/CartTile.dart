import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laravel_heroku/Model/CartModel.dart';
import 'package:laravel_heroku/providers/CartProvider.dart';
import 'package:laravel_heroku/theme.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  CartModel cartModel ;
  CartTile({required this.cartModel});
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
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
                        image: NetworkImage(cartModel.product?.galleries?[0].url??'assets/sepatuhiking.png'))),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartModel.product?.name ?? "",
                    style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  Text(
                  " \$ ${cartModel.product?.price}",
                    style: priceTextStyle,
                  )
                ],
              )),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      cartProvider.addQuantity(cartModel.id!);
                      print(cartProvider.totalItems());
                    },
                    child: Container(
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
                  ),
                  SizedBox(height: 2,),
                  Text(
                    cartModel.quantity.toString(),
                    style: primaryTextStyle,
                  ),
                  SizedBox(height: 2,),
                  GestureDetector(
                    onTap: (){
                      cartProvider.reduceQuantity(cartModel.id!);
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: subtitleColor),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    cartProvider.removeCart(cartModel.id!);
                  },
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
