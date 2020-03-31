import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {Key key,
      this.text,
      this.color,
      this.textColor,
      this.onPressed,
      this.isEnabled = true});

  final bool isEnabled;
  final String text;
  final int color;
  final int textColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      disabledColor: Color(0xFFCAD5F9),
      disabledTextColor: Colors.white,
      color: Color(color),
      padding: EdgeInsets.all(18),
      textColor: Color(textColor),
      onPressed: isEnabled ? onPressed : null,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(24.0),
      ),
    );
  }
}
