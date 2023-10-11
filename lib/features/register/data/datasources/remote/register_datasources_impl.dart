import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_glass/features/register/data/datasources/register_datasources.dart';

class RegisterDatasourcesImpl implements RegisterDataSources{

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future signUp(String email, String password) async{
    return await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

}