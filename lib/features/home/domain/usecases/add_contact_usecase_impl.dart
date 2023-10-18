import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/features/home/data/model/contact_model.dart';
import 'package:project_glass/features/home/domain/repositories/home_repository.dart';
import 'package:project_glass/features/home/domain/usecases/add_contact_usecase.dart';

class AddContactUsecaseImpl implements AddContactUsecase{

  HomeRepository repository;

  AddContactUsecaseImpl(this.repository);

  @override
  Future<ContactModel> addContact(ContactParams params) {
    return repository.addContact(params);
  }

}