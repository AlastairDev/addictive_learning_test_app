import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
//    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    print("onDoneLoading");
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
                        child: Text("Addictive",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFFE00060),
                              fontSize: 55.0,
                            )),
                      ),
                      Text("Learning",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF6CC5D7),
                            fontSize: 55.0,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text("Social Learning App"),
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
