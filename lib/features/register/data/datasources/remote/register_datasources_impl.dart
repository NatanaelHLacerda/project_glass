import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_glass/features/register/data/datasources/register_datasources.dart';

class RegisterDatasourcesImpl implements RegisterDataSources {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore dataBase = FirebaseFirestore.instance;

  @override
  Future signUp(String email, String password) async {
    final futureUser = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (futureUser.user != null) {
      final usersCollection = dataBase.collection('users');
      usersCollection.doc(auth.currentUser!.uid).set({'email': email});
    }
  }
}
