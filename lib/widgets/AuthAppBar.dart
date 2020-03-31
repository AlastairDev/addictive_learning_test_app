import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({Key key, this.title, this.backButton});

  final String title;
  final Function backButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: backButton,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.none),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/Arrow.png',
                      width: 12,
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Back",
                        style:
                            TextStyle(color: Color(0xFF8F6ED5), fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Color(0xFF32325D)),
          ),
        ),
        Expanded(flex: 1, child: Text(""))
      ],
    );
  }
}
