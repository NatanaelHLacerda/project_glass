import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:project_glass/core/architecture/bloc/bloc.dart';
import 'package:project_glass/core/architecture/bloc/bloc_state.dart';
import 'package:project_glass/core/architecture/bloc/event.dart';
import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_budgets_params.dart';
import 'package:project_glass/features/budgets/data/model/budget_model.dart';
import 'package:project_glass/features/budgets/domain/usecases/add_contact_usecase.dart';
import 'package:project_glass/features/budgets/domain/usecases/edit_contact_usecase.dart';
import 'package:project_glass/features/budgets/domain/usecases/get_contacts_usecase.dart';
import 'package:project_glass/features/budgets/domain/usecases/logout_user_usecase.dart';
import 'package:project_glass/features/budgets/domain/usecases/remove_contact_usecase.dart';
import 'package:project_glass/features/budgets/presentation/bloc/orders_event.dart';

class BudgetsBloc extends Bloc {
  GetContactsUsecase getContactsUsecase;
  AddContactUsecase addContactUsecase;
  RemoveContactUsecase removeContactUsecase;
  EditContactUsecase editContactUsecase;
  LogoutUserUsecase logoutUserUsecase;

  late List<BudgetModel> listContacts;

  BudgetsBloc(
    this.getContactsUsecase,
    this.addContactUsecase,
    this.removeContactUsecase,
    this.editContactUsecase,
    this.logoutUserUsecase,
  ) {
    listContacts = [];
  }

  @override
  mapListenEvent(Event event) {
    if (event is BudgetsEventGetContacts) {
      _handleGetContacts();
    } else if (event is BudgetsEventAddContact) {
      _handleAddContact(event.params);
    } else if (event is BudgetsEventRemoveContact) {
      _handleRemoveContact(event.contactModel);
    } else if (event is BudgetsEventEditContact) {
      _handleEditContact(event.params);
    } else if (event is BudgetsEventShowCustomDialog) {
      _handleShowDialog(event.context, event.dialog);
    } else if (event is BudgetsEventLogoutUser) {
      _handleLogoutUser(event.context);
    }
  }

  Future _handleLogoutUser(BuildContext context) async {
    final result = await logoutUserUsecase.logoutUser();
    Navigator.pushNamedAndRemoveUntil(context, result, (route) => false);
  }

  Future _handleShowDialog(BuildContext context, Widget dialog) async {
    return showDialog(context: context, builder: (context) => dialog);
  }

  Future _handleGetContacts() async {
    await getContactsUsecase.getContacts().then((value) {
      listContacts = value;

      if (value.isEmpty) {
        dispatchState(BlocEmptyState(data: null));
      } else {
        inspect(listContacts);
        dispatchState(BlocStableState(data: listContacts));
      }
    });
  }

  Future _handleAddContact(BudgetParams params) async {
    if (params.key.currentState?.validate() ?? false) {
      try {
        final contact = await addContactUsecase.addContact(params);

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

  Future<void> _handleRemoveContact(BudgetModel contactModel) async {
    try {
      await removeContactUsecase.removeContact(contactModel.id);

      listContacts.remove(contactModel);

      dispatchState(BlocStableState(data: listContacts));
    } on Exception catch (e) {
    }
  }

  Future _handleEditContact(EditBudgetParams params) async {
    if (params.key.currentState?.validate() ?? false) {
      try {
        final contactModel = await editContactUsecase.editContact(params);

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
