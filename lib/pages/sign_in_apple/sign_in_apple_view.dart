import 'package:addictive_learning/common/EN_en.dart';
import 'package:addictive_learning/common/app_settings.dart';
import 'package:addictive_learning/widgets/AuthAppBar.dart';
import 'package:addictive_learning/widgets/AuthButton.dart';
import 'package:flutter/material.dart';

class SignInAppleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignInAppleScreenState();
  }
}

class SignInAppleScreenState extends State<SignInAppleScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AuthAppBar(
                  title: SIGN_UP_WITH_APPLE,
                  backButton: () => Navigator.of(context).pop(),
                ),
                Image.asset(
                  "assets/Group_247.png",
                  height: 250,
                ),
                Text(
                  SIGN_UP_WITH_APPLE_TITLE,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF32325D),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 52.0, right: 54.0),
                  child: Text(
                    SIGN_UP_WITH_APPLE_TEXT,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF32325D), fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 24.0, right: 24.0),
                  child: AuthButton(
                      text: SIGN_UP_WITH_APPLE_BUTTON_TEXT,
                      color: 0xFF333333,
                      textColor: 0xFFFFFFFF,
                    onPressed: () => {Navigator.of(context).pushNamed(PAGE_SIGN_UP_APPLE)},),
                ),
              ]),
        ),
      ),
    );
  }
}
