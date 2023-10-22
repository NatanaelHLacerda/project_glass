import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_glass/core/bloc/bloc.dart';
import 'package:project_glass/core/bloc/bloc_state.dart';
import 'package:project_glass/core/bloc/event.dart';
import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_contact_params.dart';
import 'package:project_glass/features/home/data/model/contact_model.dart';
import 'package:project_glass/features/home/domain/usecases/add_contact_usecase_impl.dart';
import 'package:project_glass/features/home/domain/usecases/edit_contact_usecase_impl.dart';
import 'package:project_glass/features/home/domain/usecases/get_contacts_usecase_impl.dart';
import 'package:project_glass/features/home/domain/usecases/logout_user_usecase_impl.dart';
import 'package:project_glass/features/home/domain/usecases/remove_contact_usecase_impl.dart';
import 'package:project_glass/features/home/presentation/bloc/home_event.dart';

class HomeBloc extends Bloc {
  GetContactsUsecaseImpl getContactsUsecaseImpl;
  AddContactUsecaseImpl addContactUsecaseImpl;
  RemoveContactUsecaseImpl removeContactUsecaseImpl;
  EditContactUsecaseImpl editContactUsecaseImpl;
  LogoutUserUsecaseImpl logoutUserUsecaseImpl;

  late List<ContactModel> listContacts;

  HomeBloc(
    this.getContactsUsecaseImpl,
    this.addContactUsecaseImpl,
    this.removeContactUsecaseImpl,
    this.editContactUsecaseImpl,
    this.logoutUserUsecaseImpl,
  ) {
    listContacts = [];
  }

  @override
  mapListenEvent(Event event) {
    if (event is HomeEventGetContacts) {
      _handleGetContacts();
    } else if (event is HomeEventAddContact) {
      _handleAddContact(event.params);
    } else if (event is HomeEventRemoveContact) {
      _handleRemoveContact(event.contactModel);
    } else if (event is HomeEventEditContact) {
      _handleEditContact(event.params);
    } else if (event is HomeEventShowCustomDialog) {
      _handleShowDialog(event.context, event.dialog);
    } else if (event is HomeEventLogoutUser) {
      _handleLogoutUser(event.context);
    }
  }

  Future _handleLogoutUser(BuildContext context) async {
    final result = await logoutUserUsecaseImpl.logoutUser();
    Navigator.pushNamedAndRemoveUntil(context, result, (route) => false);
  }

  Future _handleShowDialog(BuildContext context, Widget dialog) async {
    return showDialog(context: context, builder: (context) => dialog);
  }

  Future _handleGetContacts() async {
    await getContactsUsecaseImpl.getContacts().then((value) {
      listContacts = value;

      if (value.isEmpty) {
        dispatchState(BlocEmptyState(data: null));
      } else {
        inspect(listContacts);
        dispatchState(BlocStableState(data: listContacts));
      }
    });
  }

  Future _handleAddContact(ContactParams params) async {
    if (params.key.currentState?.validate() ?? false) {
      try {
        final contact = await addContactUsecaseImpl.addContact(params);

        listContacts.add(contact);
        inspect(listContacts);
        ScaffoldMessenger.of(params.context).showSnackBar(
            const SnackBar(content: Text('Contato adicionado com sucesso')));
        dispatchState(BlocStableState(data: listContacts));
        Navigator.pop(params.context);
      } on Exception catch (e) {
        ScaffoldMessenger.of(params.context).showSnackBar(
            const SnackBar(content: Text('Contato adicionado com sucesso')));
      }
    }
  }

  Future<void> _handleRemoveContact(ContactModel contactModel) async {
    try {
      await removeContactUsecaseImpl.removeContact(contactModel.id);

      listContacts.remove(contactModel);

      dispatchState(BlocStableState(data: listContacts));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future _handleEditContact(EditContactParams params) async {
    if (params.key.currentState?.validate() ?? false) {
      try {
        final contactModel = await editContactUsecaseImpl.editContact(params);

        listContacts.removeAt(params.index);
        listContacts.insert(params.index, contactModel);

        dispatchState(BlocStableState(data: listContacts));

        ScaffoldMessenger.of(params.context).showSnackBar(
            const SnackBar(content: Text('Contato editado com sucesso')));

        Navigator.pop(params.context);
      } on Exception catch (e) {
        ScaffoldMessenger.of(params.context).showSnackBar(
            const SnackBar(content: Text('Falha ao editar o contato')));

        Navigator.pop(params.context);
      }
    }
  }
}
