import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laravel_heroku/View/components/WishTile.dart';
import 'package:laravel_heroku/providers/WishListProvider.dart';
import 'package:laravel_heroku/theme.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);
    Widget header() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          "Favorite Shoes",
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
      );
    }

    Widget emptyFavorite() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/love.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "You don't have dream shoes?",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Let's find your favorite shoes",
              style: secondaryTextStyle.copyWith(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {},
                child: Text(
                  "Explore Store",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            )
          ],
        ),
      ));
    }

    Widget content() {
      return Expanded(
          child: Container(
            color: backgroundColor3,
        child: ListView(padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children:wishListProvider.wishlist.map((e) => WishTile(product: e,)).toList(),
        ),
      ));
    }

    return Column(
      children: [header(),wishListProvider.wishlist.length == 0 ? emptyFavorite():content()],
    );
  }
}
