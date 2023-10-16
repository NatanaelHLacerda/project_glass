import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_glass/features/login/data/datasources/login_datasources.dart';

class LoginDatasourcesImpl implements LoginDatasources{

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future signIn(String email, String password) async{
    return await auth.signInWithEmailAndPassword(email: email, password: password);
  }

}