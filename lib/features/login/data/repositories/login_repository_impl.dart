import 'package:project_glass/features/login/data/datasources/login_datasources.dart';
import 'package:project_glass/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginDatasources datasources;

  LoginRepositoryImpl(this.datasources);

  @override
  signIn(String email, String password) {
    return datasources.signIn(email, password);
  }
}
