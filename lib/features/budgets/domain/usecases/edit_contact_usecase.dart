import 'package:project_glass/core/params/edit_budgets_params.dart';
import 'package:project_glass/features/budgets/data/model/budget_model.dart';

abstract class EditContactUsecase {
  Future<BudgetModel> editContact(EditBudgetParams params);
}
