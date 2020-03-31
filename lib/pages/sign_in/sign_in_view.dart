import 'package:addictive_learning/common/EN_en.dart';
import 'package:addictive_learning/common/app_settings.dart';
import 'package:addictive_learning/pages/sign_in/sign_in_bloc.dart';
import 'package:addictive_learning/widgets/AuthAppBar.dart';
import 'package:addictive_learning/widgets/AuthButton.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  SignInBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SignInBloc();
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
                  title: SIGN_IN_SCREEN_TITLE,
                  backButton: () => Navigator.of(context).pop(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                  child: StreamBuilder(
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
                  child: StreamBuilder(
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
                  child: StreamBuilder(
                    stream: _bloc.confirmPasswordStream,
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
                StreamBuilder(
                    stream: _bloc.isPasswordWrongStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data == false) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                PAGE_RESET_PASSWORD,
                                (Route<dynamic> route) => false);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0, right: 24.0, top: 24.0),
                            child: Text(
                              SIGN_IN_BUTTON_RESET_PASSWORD,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xFFBFBFBF),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(color: Colors.white // This is optional
                            );
                      }
                    }),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                  child: StreamBuilder(
                    stream: _bloc.isFormValid,
                    builder: (context, snapshot) => AuthButton(
                      text: SIGN_IN_BUTTON_TEXT,
                      color: 0xFF5A7BEF,
                      textColor: 0xFFFFFFFF,
                      onPressed: () => {
                        _bloc.formSubmit((isLoggedIn) {
                          if (isLoggedIn) {
                            //TODO: change route to main screen
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                PAGE_AUTH, (Route<dynamic> route) => false);
                          }
                        })
                      },
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
                        "Or",
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
