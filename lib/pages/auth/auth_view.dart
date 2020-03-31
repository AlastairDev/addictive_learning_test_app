import 'package:addictive_learning/common/EN_en.dart';
import 'package:addictive_learning/common/app_settings.dart';
import 'package:addictive_learning/widgets/AuthButton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _acceptTerms = false;
  double _imgScale = 1.0;
  double _btnPadding = 16.0;
  double _carouselSize = 410.0;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    if (MediaQuery.of(context).size.height < 780) {
      _carouselSize = 310.0;
      _imgScale = 2.0;
      _btnPadding = 0.0;
    }
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CarouselSlider(
              autoPlay: true,
              autoPlayInterval: Duration(milliseconds: 5000),
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              height: _carouselSize,
              items: <Widget>[
                _sliderComponent(
                    'assets/Site-constructor1.png', AUTH_VIEW_SLIDER_TEXT_1),
                _sliderComponent('assets/New_app.png', AUTH_VIEW_SLIDER_TEXT_2),
                _sliderComponent(
                    'assets/Group_164.png', AUTH_VIEW_SLIDER_TEXT_3),
              ],
            ),
            _authButton(
                AUTH_VIEW_SIGN_UP_FACEBOOK, 0xFF5A7BEF, 0xFFFFFFFF, () => {}),
            _authButton(AUTH_VIEW_SIGN_UP_GMAIL, 0xFFFB6340, 0xFFFFFFFF, () => {}),
            _authButton(AUTH_VIEW_SIGN_UP_JOIN_NOW, 0xFFFFFFFF, 0xFF000000, () {
              if (_acceptTerms) {
                Navigator.of(context).pushNamed(PAGE_SIGN_UP);
              } else {
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text(AUTH_VIEW_SIGN_UP_TERM_OF_USE),
                ));
              }
            }),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  onChanged: (bool value) {
                    setState(() => this._acceptTerms = value);
                  },
                  value: _acceptTerms,
                ),
                Text(
                  AUTH_VIEW_SIGN_UP_ACCEPT,
                  style: TextStyle(
                    color: Color(0xFFBFBFBF),
                  ),
                ),
                GestureDetector(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Text(
                    AUTH_VIEW_SIGN_UP_TERMS,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xFFBFBFBF),
                    ),
                  ),
                )),
                Text(
                  AUTH_VIEW_SIGN_UP_AND,
                  style: TextStyle(
                    color: Color(0xFFBFBFBF),
                  ),
                ),
                GestureDetector(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Text(
                    AUTH_VIEW_SIGN_UP_PRIVACY_POLICY,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xFFBFBFBF),
                    ),
                  ),
                )),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AUTH_VIEW_SIGN_UP_ALREADY_HAVE_ACCOUNT,
                  style: TextStyle(
                    color: Color(0xFFBFBFBF),
                  ),
                ),
                GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(PAGE_SIGN_IN),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Text(
                        AUTH_VIEW_SIGN_UP_SIGN_IN,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFFBFBFBF),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _authButton(text, color, textColor, onPressed) {
    return Padding(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, top: _btnPadding),
        child: AuthButton(
          text: text,
          color: color,
          textColor: textColor,
          onPressed: onPressed,
        ));
  }

  Widget _sliderComponent(imgAsset, text) {
    return Column(
      children: <Widget>[
        Image.asset(imgAsset, scale: _imgScale),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF32325D),
            ),
          ),
        )
      ],
    );
  }
}
