import 'dart:async';
import 'package:addictive_learning/common/EN_en.dart';
import 'package:addictive_learning/common/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushNamedAndRemoveUntil(PAGE_AUTH, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/logo_white.png'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 56),
                        child: Text(SPLASH_TITLE_1,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFFE00060),
                              fontSize: 55.0,
                            )),
                      ),
                      Text(SPLASH_TITLE_2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF6CC5D7),
                            fontSize: 55.0,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(SPLASH_TEXT),
                      ),
                    ],
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
