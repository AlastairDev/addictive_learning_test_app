import 'package:addictive_learning/pages/auth/auth_view.dart';
import 'package:addictive_learning/pages/main/main_view.dart';
import 'package:addictive_learning/pages/reset_password/reset_password_view.dart';
import 'package:addictive_learning/pages/reset_password_email_sent/reset_password_sent_view.dart';
import 'package:addictive_learning/pages/sign_in/sign_in_view.dart';
import 'package:addictive_learning/pages/sign_in_apple/sign_in_apple_view.dart';
import 'package:addictive_learning/pages/sign_up/sign_up_view.dart';
import 'package:addictive_learning/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:addictive_learning/common/app_settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      initialRoute: PAGE_SPLASH,
      routes: {
        PAGE_SPLASH: (context) => SplashScreen(),
        PAGE_AUTH: (context) => AuthScreen(),
        PAGE_SIGN_UP: (context) => SignUpScreen(),
        PAGE_SIGN_IN: (context) => SignInScreen(),
        PAGE_RESET_PASSWORD: (context) => ResetPasswordScreen(),
        PAGE_RESET_PASSWORD_SENT: (context) => ResetPasswordSentScreen(),
        PAGE_SIGN_UP_APPLE: (context) => SignInAppleScreen(),
        PAGE_MAIN: (context) => MainScreen(),
      },
    );
  }
}
