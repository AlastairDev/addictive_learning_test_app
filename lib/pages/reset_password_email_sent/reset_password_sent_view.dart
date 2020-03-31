import 'package:addictive_learning/widgets/AuthAppBar.dart';
import 'package:addictive_learning/widgets/AuthButton.dart';
import 'package:flutter/material.dart';
import 'package:addictive_learning/common/EN_en.dart';

class ResetPasswordSentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResetPasswordSentScreenState();
}

class ResetPasswordSentScreenState extends State<ResetPasswordSentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AuthAppBar(
                  title: RESET_PASSWORD_SCREEN_TITLE,
                  backButton: () => Navigator.of(context).pop(),
                ),
                Image.asset("assets/1.png"),
                Text(
                  RESET_PASSWORD_EMAIL_SENT,
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
                    RESET_PASSWORD_TEXT,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF32325D), fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 24.0, right: 24.0),
                  child: AuthButton(
                      text: RESET_PASSWORD_EMAIL_BUTTON_TEXT,
                      color: 0xFF5A7BEF,
                      textColor: 0xFFFFFFFF,
                      onPressed: () => {}),
                ),
              ]),
        ),
      ),
    );
  }
}
