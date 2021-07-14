import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/Model/UserModel.dart';
import 'package:laravel_heroku/View/components/ProductPopularCard.dart';
import 'package:laravel_heroku/View/components/ProductTile.dart';
import 'package:laravel_heroku/providers/AuthProvider.dart';
import 'package:laravel_heroku/providers/ProductProvider.dart';
import 'package:laravel_heroku/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    print(productProvider.products.length);
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo,${user.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    '${user.username}',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  image: DecorationImage(
                      image: NetworkImage(user.profilePhotoUrl ??
                          "https://pbs.twimg.com/profile_images/3058705279/f548c9e85d5ec132dd227e3f4b91cbed_400x400.jpeg"))),
            )
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: primary),
                child: Text(
                  'All shoes',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor),
                child: Text(
                  'Running',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor),
                child: Text(
                  'Training',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor),
                child: Text(
                  'Basketball',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor),
                child: Text(
                  'Hiking',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: List.generate(
                    productProvider.products.length,
                    (index) => ProductPopularCard(
                        product: productProvider.products[index])),
              )
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'New Arrival',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    Widget newArrivalProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
            children: productProvider.products
                .map((e) => ProductTile(product: e))
                .toList()),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor1,
        body: ListView(
          children: [
            header(),
            categories(),
            popularProductsTitle(),
            popularProducts(),
            newArrivalsTitle(),
            newArrivalProducts()
          ],
        ));
  }
}
