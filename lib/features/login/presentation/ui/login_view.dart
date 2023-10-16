import 'package:flutter/material.dart';
import 'package:project_glass/core/bloc/bloc_state.dart';
import 'package:project_glass/features/login/data/datasources/remote/login_datasources_impl.dart';
import 'package:project_glass/features/login/data/repositories/login_repository_impl.dart';
import 'package:project_glass/features/login/domain/usecases/signin_usecase_impl.dart';
import 'package:project_glass/features/login/presentation/bloc/login_bloc.dart';
import 'package:project_glass/features/login/presentation/bloc/login_event.dart';
import 'package:project_glass/features/login/presentation/ui/login_view_stable_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginBloc bloc =
      LoginBloc(SignInUsecaseImpl(LoginRepositoryImpl(LoginDatasourcesImpl())));

  @override
  void initState() {
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
