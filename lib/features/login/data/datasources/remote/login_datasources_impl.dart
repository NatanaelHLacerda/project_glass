import 'package:project_glass/core/services/auth_service.dart';
import 'package:project_glass/features/login/data/datasources/login_datasources.dart';

class LoginDatasourcesImpl implements LoginDatasources{

  final AuthService authService;
  LoginDatasourcesImpl(this.authService);

  @override
  Future signIn(String email, String password) async{
    return await authService.instance.signInWithEmailAndPassword(email: email, password: password);
  }

}