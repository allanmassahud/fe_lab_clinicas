import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/user/i_user_repository.dart';
import './i_user_login_service.dart';//

class UserLoginServiceImpl implements IUserLoginService {
  final IUserRepository userRepository;

  UserLoginServiceImpl({required this.userRepository});
  
  
  @override
  Future<Either<ServiceException, Unit>> execute(String email, String senha) async{
    final loginResult = await userRepository.login(email, senha);
    switch(loginResult){
      case Left(value: AuthError()):
        return Left(ServiceException(message: "Erro ao realizar login"));
      case Left(value: AuthUnauthorizedException()):
        return Left(ServiceException(message: "Login ou senha inválidos"));
      case Right(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageConstants.accessToken, accessToken);
        return Right(unit);
    }
  }

}