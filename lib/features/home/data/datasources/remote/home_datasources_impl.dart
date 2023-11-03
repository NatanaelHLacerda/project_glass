import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_contact_params.dart';
import 'package:project_glass/core/routes/const_routes.dart';
import 'package:project_glass/core/services/auth_service.dart';
import 'package:project_glass/core/services/database_service.dart';
import 'package:project_glass/features/home/data/datasources/home_datasources.dart';
import 'package:project_glass/features/home/data/model/contact_model.dart';

class HomeDataSourcesImpl implements HomeDataSources {
  final AuthService authService;
  final ConstRoutes routes;
  final DatabaseService databaseService;

  HomeDataSourcesImpl(this.authService, this.databaseService, this.routes);

  @override
  Future<List<ContactModel>> getContacts() async {
    final contacts = await databaseService.instance
        .collection('users')
        .doc(authService.instance.currentUser!.uid)
        .collection('contacts')
        .get();

    List<ContactModel> listContacts =
        contacts.docs.map((e) => ContactModel.fromMap(e)).toList();

    return listContacts;
  }

  @override
  Future<ContactModel> addContact(ContactParams params) async {
    final doc = databaseService.instance
        .collection('users')
        .doc(authService.instance.currentUser!.uid)
        .collection('contacts')
        .doc();

    final contactModel =
        ContactModel(name: params.nome, phone: params.phone, id: doc.id);

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
  Future<ContactModel> editContact(EditContactParams params) async {
    final contactEdited =
        ContactModel(name: params.name, phone: params.phone, id: params.id);

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
