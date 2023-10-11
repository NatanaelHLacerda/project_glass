import 'package:project_glass/features/register/domain/repositories/register_repository.dart';
import 'package:project_glass/features/register/domain/usecases/signup_usecase.dart';

class SignupUseCaseImpl implements SignUpUsecase {
  RegisterRepository repository;

  SignupUseCaseImpl(this.repository);

  @override
  signUp(String email, String password) {
    return repository.signUp(email, password);
  }
}
