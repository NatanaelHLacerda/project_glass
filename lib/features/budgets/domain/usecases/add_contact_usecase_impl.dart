import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/features/budgets/data/model/budget_model.dart';
import 'package:project_glass/features/budgets/domain/repositories/budgets_repository.dart';
import 'package:project_glass/features/budgets/domain/usecases/add_contact_usecase.dart';

class AddContactUsecaseImpl implements AddContactUsecase{

  BudgetsRepository repository;

  AddContactUsecaseImpl(this.repository);

  @override
  Future<BudgetModel> addContact(BudgetParams params) {
    return repository.addContact(params);
  }

}