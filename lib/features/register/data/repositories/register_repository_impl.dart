import 'package:project_glass/features/register/data/datasources/register_datasources.dart';
import 'package:project_glass/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {

  final RegisterDataSources dataSources;

  RegisterRepositoryImpl(this.dataSources);

  @override
  signUp(String email, String password) {
    return dataSources.signUp(email, password);
  }
  
}