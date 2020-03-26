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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text("Loading...")),
      ),
    );
  }
}