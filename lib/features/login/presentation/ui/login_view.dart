import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_glass/core/architecture/bloc/bloc_state.dart';
import 'package:project_glass/features/login/presentation/bloc/login_bloc.dart';
import 'package:project_glass/features/login/presentation/bloc/login_event.dart';
import 'package:project_glass/features/login/presentation/ui/login_view_stable_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    bloc.dispatchEvent(LoginOnReadyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.state,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            if (snapShot.data is BlocStableState) {
              return LoginViewStableState(bloc: bloc);
            }
          }
          return Container();
        });
  }
}
