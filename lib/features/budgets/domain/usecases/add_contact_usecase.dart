import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/features/budgets/data/model/budget_model.dart';

abstract class AddContactUsecase {
  Future<BudgetModel> addContact(BudgetParams params);
}