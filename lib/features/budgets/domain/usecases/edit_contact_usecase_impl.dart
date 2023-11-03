import 'package:project_glass/core/params/edit_budgets_params.dart';
import 'package:project_glass/features/budgets/data/model/budget_model.dart';
import 'package:project_glass/features/budgets/domain/repositories/budgets_repository.dart';
import 'package:project_glass/features/budgets/domain/usecases/edit_contact_usecase.dart';

class EditContactUsecaseImpl implements EditContactUsecase{
  BudgetsRepository repository;
  EditContactUsecaseImpl(this.repository);

  @override
  Future<BudgetModel> editContact(EditBudgetParams params) {
    return repository.editContact(params);
  }

}