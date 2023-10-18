import 'package:project_glass/features/home/data/model/contact_model.dart';

abstract class GetContactsUsecase {
  Future<List<ContactModel>> getContacts();
}