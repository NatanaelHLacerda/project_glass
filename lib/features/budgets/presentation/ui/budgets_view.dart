import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_glass/core/architecture/bloc/bloc_state.dart';
import 'package:project_glass/features/budgets/presentation/bloc/orders_bloc.dart';
import 'package:project_glass/features/budgets/presentation/bloc/orders_event.dart';
import 'package:project_glass/features/budgets/presentation/ui/budgets_view_empty_state.dart';
import 'package:project_glass/features/budgets/presentation/ui/budgets_view_stable_state.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project_glass/features/budgets/presentation/widgets/add_edit_contact_custom_dialog.dart';

class BudgetsView extends StatefulWidget {
  const BudgetsView({super.key});

  @override
  State<BudgetsView> createState() => _BudgetsViewState();
}

class _BudgetsViewState extends State<BudgetsView> {
  late BudgetsBloc bloc;

  late TextEditingController nameController;
  late TextEditingController phoneController;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final MaskTextInputFormatter maskTextInputFormatter =
      MaskTextInputFormatter(mask: '(##) #####-####');

  @override
  void initState() {

    bloc = GetIt.I.get();

    nameController = TextEditingController();
    phoneController = TextEditingController();

    bloc.dispatchEvent(BudgetsEventGetContacts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orçamentos'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () =>
                  bloc.dispatchEvent(BudgetsEventLogoutUser(context)),
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.dispatchEvent(BudgetsEventShowCustomDialog(
            context: context,
            dialog: AddEditContactCustomDialog(
              model: null,
              edit: false,
              gkey: _globalKey,
              bloc: bloc,
              context: context,
              index: null,
            ))),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: StreamBuilder(
          stream: bloc.state,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              if (snapShot.data is BlocStableState) {
                return BudgetsViewStableState(
                  listContacts: bloc.listContacts,
                  bloc: bloc,
                );
              } else if (snapShot.data is BlocEmptyState) {
                return const BudgetsViewEmptyState();
              }
            }
            return Container();
          }),
    );
  }
}
