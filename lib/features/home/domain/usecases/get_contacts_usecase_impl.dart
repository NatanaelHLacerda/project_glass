import 'package:project_glass/features/home/data/model/contact_model.dart';
import 'package:project_glass/features/home/domain/repositories/home_repository.dart';
import 'package:project_glass/features/home/domain/usecases/get_contacts_usecase.dart';

class GetContactsUsecaseImpl implements GetContactsUsecase{
  HomeRepository repository;

  GetContactsUsecaseImpl(this.repository);


  @override
  Future<List<ContactModel>> getContacts() {
    return repository.getContacts();
  }

}