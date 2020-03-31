import 'package:addictive_learning/common/BaseBloc.dart';
import 'package:addictive_learning/common/EN_en.dart';
import 'package:addictive_learning/common/utils.dart';
import 'file:///C:/Users/Tesseract/Desktop/flutter_ws/flutter_app/lib/common/Validators.dart';
import 'package:addictive_learning/repository/UserRepository.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc extends Object with Validators implements BaseBloc {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmController = BehaviorSubject<String>();
  final _isPasswordWrongController = BehaviorSubject<bool>();

  Function(String) get emailChanged => _emailController.sink.add;

  Function(String) get passwordChanged => _passwordController.sink.add;

  Function(String) get confirmPasswordChanged =>
      _passwordConfirmController.sink.add;

  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidator);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidator);

  Stream<String> get confirmPasswordStream => _passwordConfirmController.stream
          .transform(passwordValidator)
          .doOnData((String data) {
        if (0 != _passwordController.value.compareTo(data)) {
          _passwordConfirmController.addError(INPUTS_NO_MATCH);
        }
      });

  Stream<bool> get isFormValid => Rx.combineLatest3(
      _emailController,
      _passwordController,
      _passwordConfirmController,
      (e, p, c) => (0 == p.compareTo(c) && isEmail(e)));

  Stream<bool> get isPasswordWrongStream => _isPasswordWrongController.stream;

  void formSubmit(callback) {
    UserRepository repository = UserRepository();
    repository
        .logInUser(_emailController.value, _passwordController.value)
        .then((code) {
      if (code == 422) {
        _emailController.addError(INPUT_WRONG_DATA);
        _passwordController.addError(INPUT_WRONG_DATA);
         _passwordConfirmController.addError(INPUT_WRONG_DATA);
        _isPasswordWrongController.add(false);
      }else if(code == 200){
        callback(true);
      }
    });
  }

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
    _passwordConfirmController?.close();
  }
}
