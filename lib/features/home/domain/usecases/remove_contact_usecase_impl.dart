import 'package:project_glass/features/home/domain/repositories/home_repository.dart';
import 'package:project_glass/features/home/domain/usecases/remove_contact_usecase.dart';

class RemoveContactUsecaseImpl implements RemoveContactUsecase {

  HomeRepository repository;

  RemoveContactUsecaseImpl(this.repository);

  @override
  Future<void> removeContact(String id) {
    return repository.removeContact(id);
  }

}