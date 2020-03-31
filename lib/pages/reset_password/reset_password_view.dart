import 'package:addictive_learning/common/utils.dart';
import 'package:addictive_learning/pages/reset_password/reset_password_bloc.dart';
import 'package:addictive_learning/widgets/AuthAppBar.dart';
import 'package:addictive_learning/widgets/AuthButton.dart';
import 'package:flutter/material.dart';
import 'package:addictive_learning/common/EN_en.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ResetPasswordBloc();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

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
                  backButton: () => {},
                ),
                StreamBuilder(
                  stream: _bloc.emailStream,
                  builder: (context, snapshot) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      onChanged: _bloc.emailChanged,
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(labelText: INPUT_EMAIL),
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: _bloc.isFormValid,
                  builder: (context, snapshot) => Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: AuthButton(
                      text: RESET_PASSWORD_BUTTON_TEXT,
                      color: 0xFF5A7BEF,
                      textColor: 0xFFFFFFFF,
                      onPressed: () => {_bloc.formSubmit()},
                      isEnabled: snapshot.hasData ? snapshot.data : false,
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
