import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laravel_heroku/View/components/TextFormField.dart';
import 'package:laravel_heroku/theme.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obsecureText = true;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget header(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style:
              primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign In to Continue',
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }

    Widget emailInput(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Email_Iconemail_icon.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFieldCustomDevice(
                          controller: emailController,
                          hint: "Email Address",
                          obsecureText: false,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Password_Iconpassword_icon.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFieldCustomDevice(
                          controller: passwordController,
                          hint: "Password",
                          obsecureText: obsecureText,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (obsecureText == true) {
                              obsecureText = false;
                            } else {
                              obsecureText = true;
                            }
                          });
                        },
                        icon: Icon(
                          obsecureText
                              ? Icons.remove_red_eye_sharp
                              : Icons.remove_red_eye_outlined,
                          color: primary,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Text(
              'Sign in',
              style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            style: TextButton.styleFrom(
                backgroundColor: primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
      );
    }

    Widget footer(BuildContext context) {
      return Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account",style: subtitleTextStyle.copyWith(fontSize: 12),),
              TextButton(onPressed: () {
                Navigator.pushNamed(context, '/sign-up');
              }, child: Text('Sign up',style: purpleTextStyle.copyWith(fontSize: 12,fontWeight: medium),))
            ],
          ));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(context),
              emailInput(context),
              passwordInput(context),
              signInButton(),
              Spacer(),
              footer(context)
            ],
          ),
        ),
      ),
    );
  }
}
