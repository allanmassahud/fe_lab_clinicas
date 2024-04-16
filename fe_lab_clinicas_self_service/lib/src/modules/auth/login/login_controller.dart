import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/services/i_user_login_service.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginController with MessageStateMixin {
  final _obscurePassword = signal(true);
  bool get obscurePassword => _obscurePassword.value; // ou _obscurePassword()
  final _logged = signal(false);
  bool get logged => _logged(); // ou _logged.value
  final IUserLoginService _loginService;

  LoginController({
    required IUserLoginService loginService,
  }) : _loginService = loginService;


  void togglePassword() => _obscurePassword.value = !_obscurePassword.value;

  Future<void> login(String email, String senha) async {
    final loginResul = await _loginService.execute(email, senha).asyncLoader();
    switch (loginResul) {
      case Left(value: ServiceException(:final message)):
        showError(message);
      case Right(value: _):
        showSuccess("Usuário logado com sucesso!");
        _logged.value = true;
    }
  }
}
