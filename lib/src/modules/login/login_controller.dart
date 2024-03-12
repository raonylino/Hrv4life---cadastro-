// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:asyncstate/asyncstate.dart';
import 'package:hrv4life_core/hrv4life_core.dart';
import 'package:hrv4life_flutter/src/services/user_login_service.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginController with MessageStateMixin {

  LoginController({
     required UserLoginServices loginService,
  }): _loginService = loginService;

  final UserLoginServices _loginService; 

  final _obscurePassword = signal(true);
  final _logged = signal(false);

  bool get logged => _logged();
  bool get obscurePassword => _obscurePassword();

  void passwordToggle() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  Future<void> login(String email, String password) async{
    final loginResult = await _loginService.execute(email, password).asyncLoader();

    switch(loginResult){
      case Left(value:ServiceException(:final message)):
        showError(message);
      case Right(value: _):
        _logged.value = true;

    }
  }
}
