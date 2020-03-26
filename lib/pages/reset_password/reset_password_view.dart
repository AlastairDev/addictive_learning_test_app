import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ResetPasswordScreenState();
  }
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {

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