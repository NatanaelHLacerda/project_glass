import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_budgets_params.dart';
import 'package:project_glass/features/budgets/data/model/budget_model.dart';

abstract class BudgetsDataSources {

  Future<List<BudgetModel>> getContacts();

  Future<BudgetModel> addContact(BudgetParams params);

  Future<void> removeContact(String id);

  Future<BudgetModel> editContact(EditBudgetParams params);

  Future<String> logoutUser();
}