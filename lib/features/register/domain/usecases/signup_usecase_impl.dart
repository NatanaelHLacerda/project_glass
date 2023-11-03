import 'package:project_glass/features/register/domain/repositories/register_repository.dart';
import 'package:project_glass/features/register/domain/usecases/signup_usecase.dart';

class SignUpUseCaseImpl implements SignUpUsecase {
  final RegisterRepository repository;

  SignUpUseCaseImpl(this.repository);

  @override
  signUp(String email, String password) {
    return repository.signUp(email, password);
  }
}
