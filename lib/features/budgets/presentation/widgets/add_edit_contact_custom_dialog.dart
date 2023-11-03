import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project_glass/core/params/contact_params.dart';
import 'package:project_glass/core/params/edit_budgets_params.dart';
import 'package:project_glass/core/utils/form_builder_validator.dart';
import 'package:project_glass/features/budgets/data/model/budget_model.dart';
import 'package:project_glass/features/budgets/presentation/bloc/orders_bloc.dart';
import 'package:project_glass/features/budgets/presentation/bloc/orders_event.dart';

class AddEditContactCustomDialog extends StatefulWidget {
  final GlobalKey<FormState> gkey;
  final BuildContext context;
  final BudgetsBloc bloc;
  final BudgetModel? model;
  final bool edit;
  final int? index;

  const AddEditContactCustomDialog({
    super.key,
    required this.gkey,
    required this.context,
    required this.bloc,
    required this.model,
    required this.edit,
    required this.index,
  });

  @override
  State<AddEditContactCustomDialog> createState() =>
      _AddEditContactCustomDialogState();
}

class _AddEditContactCustomDialogState
    extends State<AddEditContactCustomDialog> {
  late TextEditingController nameController;
  late TextEditingController phoneController;

  MaskTextInputFormatter maskTextInputFormatter =
      MaskTextInputFormatter(mask: '(##) #####-####');

  @override
  void initState() {
    widget.edit == false
        ? nameController = TextEditingController()
        : nameController = TextEditingController(text: widget.model!.name);
    widget.edit == false
        ? phoneController = TextEditingController()
        : phoneController = TextEditingController(text: widget.model!.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicione um novo contato'),
      content: Form(
          key: widget.gkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) => FormBuilderValidator.nameValidate(value),
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Nome completo',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                inputFormatters: [
                  maskTextInputFormatter,
                ],
                validator: (value) => FormBuilderValidator.phoneValidate(value),
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: 'Celular',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          )),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.pop(widget.context),
            child: const Text('Cancelar')),
        ElevatedButton(
            onPressed: () => widget.bloc.dispatchEvent(widget.edit == false
                ? BudgetsEventAddContact(
                    params: BudgetParams(
                        nome: nameController.text,
                        phone: phoneController.text,
                        key: widget.gkey,
                        context: context))
                : BudgetsEventEditContact(
                    params: EditBudgetParams(
                    name: nameController.text,
                    phone: phoneController.text,
                    id: widget.model!.id,
                    index: widget.index!,
                    key: widget.gkey,
                    context: context,
                  ))),
            child: const Text('Salvar')),
      ],
    );
  }
}
