import 'package:project_glass/features/home/domain/repositories/home_repository.dart';
import 'package:project_glass/features/home/domain/usecases/logout_user_usecase.dart';

class LogoutUserUsecaseImpl implements LogoutUserUsecase {
  final HomeRepository repository;

  LogoutUserUsecaseImpl(this.repository);
  @override
  Future<String> logoutUser() {
    return repository.logoutUser();
  }
}
