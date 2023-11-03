import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project_glass/features/budgets/data/model/budget_model.dart';
import 'package:project_glass/features/budgets/presentation/bloc/orders_bloc.dart';
import 'package:project_glass/features/budgets/presentation/bloc/orders_event.dart';
import 'package:project_glass/features/budgets/presentation/widgets/add_edit_contact_custom_dialog.dart';

class BudgetsViewStableState extends StatefulWidget {
  final BudgetsBloc bloc;
  final List<BudgetModel> listContacts;
  const BudgetsViewStableState(
      {required this.listContacts, required this.bloc, super.key});

  @override
  State<BudgetsViewStableState> createState() => _BudgetsViewStableStateState();
}

class _BudgetsViewStableStateState extends State<BudgetsViewStableState> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final MaskTextInputFormatter maskTextInputFormatter =
      MaskTextInputFormatter(mask: '(##) #####-####');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: widget.bloc.listContacts.length,
          itemBuilder: ((context, index) {
            final contact = widget.listContacts[index];
            return Dismissible(
              key: Key(contact.id),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) => widget.bloc
                  .dispatchEvent(BudgetsEventRemoveContact(contactModel: contact)),
              background: Container(
                color: Colors.redAccent,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phone),
                leading: IconButton(
                    onPressed: () =>
                        widget.bloc.dispatchEvent(BudgetsEventShowCustomDialog(
                            context: context,
                            dialog: AddEditContactCustomDialog(
                              gkey: _globalKey,
                              context: context,
                              bloc: widget.bloc,
                              model: contact,
                              edit: true,
                              index: index,
                            ))),
                    icon: const Icon(Icons.edit)),
              ),
            );
          })),
    );
  }
}
