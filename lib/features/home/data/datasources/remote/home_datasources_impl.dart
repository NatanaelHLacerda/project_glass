import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_contact_params.dart';
import 'package:project_glass/features/home/data/datasources/home_datasources.dart';
import 'package:project_glass/features/home/data/model/contact_model.dart';

class HomeDataSourcesImpl implements HomeDataSources {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<ContactModel>> getContacts() async {
    final contacts = await db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('contacts')
        .get();

    List<ContactModel> listContacts =
        contacts.docs.map((e) => ContactModel.fromMap(e)).toList();

    return listContacts;
  }

  @override
  Future<ContactModel> addContact(ContactParams params) async {
    final doc = db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('contacts')
        .doc();

    final contactModel = ContactModel(
        name: params.nome, phone: params.phone, id: doc.id);

    doc.set(toMap(contactModel));

    return contactModel;
  }

  @override
  Future<void> removeContact(String id) async {
    return await db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('contacts')
        .doc(id)
        .delete();
  }

  @override
  Future<ContactModel> editContact(
      EditContactParams params) async {
    final contactEdited = ContactModel(
        name: params.name,
        phone: params.phone,
        id: params.id);

    await db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('contacts')
        .doc(params.id)
        .update(toMap(contactEdited));

    return contactEdited;
  }
}
