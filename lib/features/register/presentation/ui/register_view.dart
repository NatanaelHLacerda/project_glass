import 'package:flutter/material.dart';
import 'package:project_glass/core/bloc/bloc_state.dart';
import 'package:project_glass/features/register/data/datasources/remote/register_datasources_impl.dart';
import 'package:project_glass/features/register/data/repositories/register_repository_impl.dart';
import 'package:project_glass/features/register/domain/usecases/signup_usecase_impl.dart';
import 'package:project_glass/features/register/presentation/bloc/register_bloc.dart';
import 'package:project_glass/features/register/presentation/bloc/register_event.dart';
import 'package:project_glass/features/register/presentation/ui/register_view_stable_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterBloc bloc = RegisterBloc(
      SignupUseCaseImpl(RegisterRepositoryImpl(RegisterDatasourcesImpl())));

  @override
  void initState() {
    bloc.dispatchEvent(RegisterOnReadyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.state,
      builder: (context, snapShot){
        if (snapShot.hasData) {
          if (snapShot.data is BlocStableState) {
            return RegisterViewStableState(bloc: bloc,);
          }
        }
        return Container();
    });
  }
}
