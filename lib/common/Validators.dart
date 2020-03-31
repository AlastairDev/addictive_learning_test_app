import 'dart:async';
import 'package:addictive_learning/common/EN_en.dart';
import 'package:addictive_learning/common/utils.dart';

mixin Validators {
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (isEmail(email)) {
      sink.add(email);
    } else {
      sink.addError(SIGN_UP_EMAIL_WRONG);
    }
  });
  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError(SIGN_UP_PASSWORD_SHORT);
    }
  });
  var isEmailValid =
      StreamTransformer<String, bool>.fromHandlers(handleData: (email, sink) {
    if (isEmail(email)) {
      sink.add(true);
    } else {
      sink.add(false);
    }
  });
}
