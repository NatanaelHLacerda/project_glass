import 'package:project_glass/features/budgets/domain/repositories/budgets_repository.dart';
import 'package:project_glass/features/budgets/domain/usecases/logout_user_usecase.dart';

class LogoutUserUsecaseImpl implements LogoutUserUsecase {
  final BudgetsRepository repository;

  LogoutUserUsecaseImpl(this.repository);
  @override
  Future<String> logoutUser() {
    return repository.logoutUser();
  }
}
