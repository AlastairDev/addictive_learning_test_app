import 'package:addictive_learning/common/EN_en.dart';
import 'package:addictive_learning/pages/sign_up/sign_up_bloc.dart';
import 'package:addictive_learning/widgets/AuthAppBar.dart';
import 'package:addictive_learning/widgets/AuthButton.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  SignUpBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SignUpBloc();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AuthAppBar(
                  title: SIGN_UP_SCREEN_TITLE,
                  backButton: () => Navigator.of(context).pop(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                  child: StreamBuilder<String>(
                    stream: _bloc.emailStream,
                    builder: (context, snapshot) => TextField(
                      onChanged: _bloc.emailChanged,
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: INPUT_EMAIL,
                        errorText: snapshot.error,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                  child: StreamBuilder<String>(
                    stream: _bloc.passwordStream,
                    builder: (context, snapshot) => TextField(
                      onChanged: _bloc.passwordChanged,
                      maxLines: 1,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: INPUT_PASSWORD,
                        errorText: snapshot.error,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                  child: StreamBuilder<String>(
                    stream: _bloc.confirmPassword,
                    builder: (context, snapshot) => TextField(
                      onChanged: _bloc.confirmPasswordChanged,
                      maxLines: 1,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        labelText: INPUT_PASSWORD_CONFIRM,
                        errorText: snapshot.error,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                  child: StreamBuilder<bool>(
                    stream: _bloc.registerValid,
                    builder: (context, snapshot) => AuthButton(
                      text: SIGN_UP_BUTTON_TEXT,
                      color: 0xFF5A7BEF,
                      textColor: 0xFFFFFFFF,
                      onPressed: () => {_bloc.formSubmit()},
                      isEnabled: snapshot.hasData ? snapshot.data : false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(children: <Widget>[
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        SIGN_UP_OR_DIVIDER,
                        style: TextStyle(color: Color(0xFFBFBFBF)),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: AuthButton(
                    text: SIGN_UP_WITH_APPLE,
                    color: 0xFF333333,
                    textColor: 0xFFFFFFFF,
                    onPressed: () => {},
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
