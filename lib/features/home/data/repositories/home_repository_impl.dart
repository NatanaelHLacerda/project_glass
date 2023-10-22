import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_contact_params.dart';
import 'package:project_glass/features/home/data/datasources/home_datasources.dart';
import 'package:project_glass/features/home/data/model/contact_model.dart';
import 'package:project_glass/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeDataSources dataSources;

  HomeRepositoryImpl(this.dataSources);

  @override
  Future<List<ContactModel>> getContacts() {
    return dataSources.getContacts();
  }

  @override
  Future<ContactModel> addContact(ContactParams params) {
    return dataSources.addContact(params);
  }

  @override
  Future<void> removeContact(String id) {
    return dataSources.removeContact(id);
  }

  @override
  Future<ContactModel> editContact(EditContactParams params) {
    return dataSources.editContact(params);
  }
  
  @override
  Future<String> logoutUser() {
    return dataSources.logoutUser();
  }
}
