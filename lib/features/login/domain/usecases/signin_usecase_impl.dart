import 'package:project_glass/features/login/domain/repositories/login_repository.dart';
import 'package:project_glass/features/login/domain/usecases/signin_usecase.dart';

class SignInUsecaseImpl implements SignInUsecase {
  final LoginRepository repository;

  SignInUsecaseImpl(this.repository);

  @override
  signIn(String email, String password) {
    return repository.signIn(email, password);
  }
}
