import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_budgets_params.dart';
import 'package:project_glass/core/routes/const_routes.dart';
import 'package:project_glass/core/services/auth_service.dart';
import 'package:project_glass/core/services/database_service.dart';
import 'package:project_glass/features/budgets/data/datasources/budgets_datasources.dart';
import 'package:project_glass/features/budgets/data/model/budget_model.dart';

class BudgetsDataSourcesImpl implements BudgetsDataSources {
  final AuthService authService;
  final ConstRoutes routes;
  final DatabaseService databaseService;

  BudgetsDataSourcesImpl(this.authService, this.databaseService, this.routes);

  @override
  Future<List<BudgetModel>> getContacts() async {
    final contacts = await databaseService.instance
        .collection('users')
        .doc(authService.instance.currentUser!.uid)
        .collection('contacts')
        .get();

    List<BudgetModel> listContacts =
        contacts.docs.map((e) => BudgetModel.fromMap(e)).toList();

    return listContacts;
  }

  @override
  Future<BudgetModel> addContact(BudgetParams params) async {
    final doc = databaseService.instance
        .collection('users')
        .doc(authService.instance.currentUser!.uid)
        .collection('contacts')
        .doc();

    final contactModel =
        BudgetModel(name: params.nome, phone: params.phone, id: doc.id);

    doc.set(toMap(contactModel));

    return contactModel;
  }

  @override
  Future<void> removeContact(String id) async {
    return await databaseService.instance
        .collection('users')
        .doc(authService.instance.currentUser!.uid)
        .collection('contacts')
        .doc(id)
        .delete();
  }

  @override
  Future<BudgetModel> editContact(EditBudgetParams params) async {
    final contactEdited =
        BudgetModel(name: params.name, phone: params.phone, id: params.id);

    await databaseService.instance
        .collection('users')
        .doc(authService.instance.currentUser!.uid)
        .collection('contacts')
        .doc(params.id)
        .update(toMap(contactEdited));

    return contactEdited;
  }

  @override
  Future<String> logoutUser() async {
    await authService.instance.signOut();

    return routes.loginView;
  }
}
