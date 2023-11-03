import 'package:project_glass/features/budgets/data/model/budget_model.dart';

abstract class GetContactsUsecase {
  Future<List<BudgetModel>> getContacts();
}