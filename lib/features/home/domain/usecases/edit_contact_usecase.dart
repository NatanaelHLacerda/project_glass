import 'package:project_glass/core/params/edit_contact_params.dart';
import 'package:project_glass/features/home/data/model/contact_model.dart';

abstract class EditContactUsecase {
  Future<ContactModel> editContact(EditContactParams params);
}
