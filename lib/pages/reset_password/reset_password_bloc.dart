import 'dart:async';

import 'package:addictive_learning/common/BaseBloc.dart';
import 'file:///C:/Users/Tesseract/Desktop/flutter_ws/flutter_app/lib/common/Validators.dart';
import 'package:addictive_learning/repository/UserRepository.dart';
import 'package:rxdart/rxdart.dart';

class ResetPasswordBloc extends Object with Validators implements BaseBloc {
  final _emailController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;

  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidator);

  Stream<bool> get isFormValid =>
      _emailController.stream.transform(isEmailValid);

  void formSubmit() {
    UserRepository repository = UserRepository();
    repository.resetPassword(_emailController.value);
  }

  @override
  void dispose() {
    _emailController?.close();
  }
}
