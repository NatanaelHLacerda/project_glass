import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_budgets_params.dart';
import 'package:project_glass/features/budgets/data/datasources/budgets_datasources.dart';
import 'package:project_glass/features/budgets/data/model/budget_model.dart';
import 'package:project_glass/features/budgets/domain/repositories/budgets_repository.dart';

class BudgetsRepositoryImpl implements BudgetsRepository {
  final BudgetsDataSources dataSources;

  BudgetsRepositoryImpl(this.dataSources);

  @override
  Future<List<BudgetModel>> getContacts() {
    return dataSources.getContacts();
  }

  @override
  Future<BudgetModel> addContact(BudgetParams params) {
    return dataSources.addContact(params);
  }

  @override
  Future<void> removeContact(String id) {
    return dataSources.removeContact(id);
  }

  @override
  Future<BudgetModel> editContact(EditBudgetParams params) {
    return dataSources.editContact(params);
  }
  
  @override
  Future<String> logoutUser() {
    return dataSources.logoutUser();
  }
}
