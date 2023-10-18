import 'package:project_glass/core/params/edit_contact_params.dart';
import 'package:project_glass/features/home/data/model/contact_model.dart';
import 'package:project_glass/features/home/domain/repositories/home_repository.dart';
import 'package:project_glass/features/home/domain/usecases/edit_contact_usecase.dart';

class EditContactUsecaseImpl implements EditContactUsecase{
  HomeRepository repository;
  EditContactUsecaseImpl(this.repository);

  @override
  Future<ContactModel> editContact(EditContactParams params) {
    return repository.editContact(params);
  }

}