import 'package:flutter/material.dart';
import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_contact_params.dart';
import 'package:project_glass/features/home/data/model/contact_model.dart';

import '../../../../core/bloc/event.dart';

class HomeEvent extends Event {}

class HomeEventGetContacts implements HomeEvent {}

class HomeEventAddContact implements HomeEvent {
  final ContactParams params;

  HomeEventAddContact({required this.params});
}

class HomeEventRemoveContact implements HomeEvent {
  final ContactModel contactModel;

  HomeEventRemoveContact({required this.contactModel});
}

class HomeEventEditContact implements HomeEvent {
  final EditContactParams params;

  HomeEventEditContact({
    required this.params,
  });
}

class HomeEventShowCustomDialog extends HomeEvent {
  final BuildContext context;
  final Widget dialog;

  HomeEventShowCustomDialog({
    required this.context,
    required this.dialog,
  });
}
