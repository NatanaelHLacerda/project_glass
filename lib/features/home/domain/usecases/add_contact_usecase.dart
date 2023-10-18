import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/features/home/data/model/contact_model.dart';

abstract class AddContactUsecase {
  Future<ContactModel> addContact(ContactParams params);
}