import 'package:flutter/material.dart';
import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_budgets_params.dart';
import 'package:project_glass/features/budgets/data/model/budget_model.dart';

import '../../../../core/architecture/bloc/event.dart';

class BudgetsEvent extends Event {}

class BudgetsEventGetContacts implements BudgetsEvent {}

class BudgetsEventAddContact implements BudgetsEvent {
  final BudgetParams params;

  BudgetsEventAddContact({required this.params});
}

class BudgetsEventRemoveContact implements BudgetsEvent {
  final BudgetModel contactModel;

  BudgetsEventRemoveContact({required this.contactModel});
}

class BudgetsEventEditContact implements BudgetsEvent {
  final EditBudgetParams params;

  BudgetsEventEditContact({
    required this.params,
  });
}

class BudgetsEventShowCustomDialog extends BudgetsEvent {
  final BuildContext context;
  final Widget dialog;

  BudgetsEventShowCustomDialog({
    required this.context,
    required this.dialog,
  });
}

class BudgetsEventLogoutUser extends BudgetsEvent {
  final BuildContext context;

  BudgetsEventLogoutUser(this.context);
}