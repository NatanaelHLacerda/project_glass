import 'package:project_glass/features/budgets/domain/repositories/budgets_repository.dart';
import 'package:project_glass/features/budgets/domain/usecases/remove_contact_usecase.dart';

class RemoveContactUsecaseImpl implements RemoveContactUsecase {

  BudgetsRepository repository;

  RemoveContactUsecaseImpl(this.repository);

  @override
  Future<void> removeContact(String id) {
    return repository.removeContact(id);
  }

}