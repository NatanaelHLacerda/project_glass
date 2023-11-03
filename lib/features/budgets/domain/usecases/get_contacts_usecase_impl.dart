import 'package:project_glass/features/budgets/data/model/budget_model.dart';
import 'package:project_glass/features/budgets/domain/repositories/budgets_repository.dart';
import 'package:project_glass/features/budgets/domain/usecases/get_contacts_usecase.dart';

class GetContactsUsecaseImpl implements GetContactsUsecase{
  BudgetsRepository repository;

  GetContactsUsecaseImpl(this.repository);


  @override
  Future<List<BudgetModel>> getContacts() {
    return repository.getContacts();
  }

}