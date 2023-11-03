import 'package:project_glass/core/services/auth_service.dart';
import 'package:project_glass/core/services/database_service.dart';
import 'package:project_glass/features/register/data/datasources/register_datasources.dart';

class RegisterDatasourcesImpl implements RegisterDataSources {
  final AuthService authService;
  final DatabaseService databaseService;

  RegisterDatasourcesImpl(this.authService, this.databaseService);

  @override
  Future signUp(String email, String password) async {
    final futureUser = await authService.instance.createUserWithEmailAndPassword(
        email: email, password: password);

    if (futureUser.user != null) {
      final usersCollection = databaseService.instance.collection('users');
      usersCollection.doc(authService.instance.currentUser!.uid).set({'email': email});
    }
  }
}
