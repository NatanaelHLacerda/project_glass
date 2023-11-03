import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_glass/core/architecture/bloc/bloc_state.dart';
import 'package:project_glass/features/home/presentation/bloc/home_bloc.dart';
import 'package:project_glass/features/home/presentation/bloc/home_event.dart';
import 'package:project_glass/features/home/presentation/ui/home_view_empty_state.dart';
import 'package:project_glass/features/home/presentation/ui/home_view_stable_state.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project_glass/features/home/presentation/widgets/add_edit_contact_custom_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc bloc;

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

    bloc.dispatchEvent(HomeEventGetContacts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home contacts'),
        actions: [
          IconButton(
              onPressed: () =>
                  bloc.dispatchEvent(HomeEventLogoutUser(context)),
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.dispatchEvent(HomeEventShowCustomDialog(
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
                return HomeViewStableState(
                  listContacts: bloc.listContacts,
                  bloc: bloc,
                );
              } else if (snapShot.data is BlocEmptyState) {
                return const HomeViewEmptyState();
              }
            }
            return Container();
          }),
    );
  }
}
