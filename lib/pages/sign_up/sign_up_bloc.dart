import 'dart:async';
import 'package:addictive_learning/common/EN_en.dart';
import 'package:addictive_learning/common/utils.dart';
import 'package:addictive_learning/repository/UserRepository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:addictive_learning/common/BaseBloc.dart';
import 'file:///C:/Users/Tesseract/Desktop/flutter_ws/flutter_app/lib/common/Validators.dart';

class SignUpBloc extends Object with Validators implements BaseBloc {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;

  Function(String) get passwordChanged => _passwordController.sink.add;

  Function(String) get confirmPasswordChanged =>
      _passwordConfirmController.sink.add;

  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidator);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidator);

  Stream<String> get confirmPassword =>
      _passwordConfirmController.stream
          .transform(passwordValidator)
          .doOnData((String data) {
        if (0 != _passwordController.value.compareTo(data)) {
          _passwordConfirmController.addError(INPUTS_NO_MATCH);
        }
      });

  Stream<bool> get registerValid =>
      Rx.combineLatest3(
          _emailController,
          _passwordController,
          _passwordConfirmController,
              (e, p, c) => (0 == p.compareTo(c) && isEmail(e))
      );

  void formSubmit() {
    UserRepository repository = UserRepository();
    repository.registerUser(_emailController.value, _passwordController.value,
        _passwordConfirmController.value);
  }

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
    _passwordConfirmController?.close();
  }
}
