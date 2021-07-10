import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/View/components/CartTile.dart';
import 'package:laravel_heroku/theme.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        title: Text("Your cart"),
        centerTitle: true,
        elevation: 0,
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Cart.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Oops! Your Cart is Empty",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Let\'s find your favorite shoes",
              style: secondaryTextStyle,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 44,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: Text(
                  "Explore Store",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        children: [CartTile(), CartTile(), CartTile()],
      );
    }

    Widget customBottomNav() {
      return Container(
        width: double.infinity,
        height: 165,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: primaryTextStyle,
                    ),
                    Text(
                      '\$287,96',
                      style: priceTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    )
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 1,
              color: subtitleColor,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: primary,
                    padding: EdgeInsets.symmetric(horizontal: 20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
