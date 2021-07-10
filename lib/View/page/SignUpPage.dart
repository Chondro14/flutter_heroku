import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:laravel_heroku/View/components/TextFormField.dart';
import 'package:laravel_heroku/theme.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    Widget header(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign up',
              style:
                  primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Register and Happy Shopping',
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }
    Widget nameInput(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style:
              primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
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
                      'assets/Username_Iconperson.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFieldCustomDevice(
                          controller: nameController,
                          hint: "Your Full name",
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
    Widget usernameInput(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style:
              primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
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
                      'assets/Unionusername.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFieldCustomDevice(
                          controller: usernameController,
                          hint: "Your username",
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

    Widget emailInput(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
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
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
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
              'Sign up',
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
              Text("Already have an account?",style: subtitleTextStyle.copyWith(fontSize: 12),),
              TextButton(onPressed: () {
                Navigator.pushNamed(context, '/sign-in');
              }, child: Text('Sign in',style: purpleTextStyle.copyWith(fontSize: 12,fontWeight: bold),))
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
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              header(context),
              nameInput(context),
              usernameInput(context),
              emailInput(context),
              passwordInput(context),signInButton(),Spacer(),footer(context)
            ],
          ),
        ),
      ),
    );
  }
}
