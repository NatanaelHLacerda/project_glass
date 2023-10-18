import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_contact_params.dart';
import 'package:project_glass/features/home/data/model/contact_model.dart';

abstract class HomeDataSources {

  Future<List<ContactModel>> getContacts();

  Future<ContactModel> addContact(ContactParams params);

  Future<void> removeContact(String id);

  Future<ContactModel> editContact(EditContactParams params);
}