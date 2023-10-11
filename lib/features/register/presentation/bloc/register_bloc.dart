import 'package:flutter/material.dart';
import 'package:project_glass/core/bloc/bloc.dart';
import 'package:project_glass/core/bloc/bloc_state.dart';
import 'package:project_glass/core/bloc/event.dart';
import 'package:project_glass/features/register/domain/usecases/signup_usecase_impl.dart';
import 'package:project_glass/features/register/presentation/bloc/register_event.dart';

class RegisterBloc extends Bloc {
  SignupUseCaseImpl signUp;

  RegisterBloc(this.signUp);

  @override
  mapListenEvent(Event event) {
    if (event is RegisterOnReadyEvent) {
      _handleOnReady();
    } else if (event is SignUpEvent) {
      _handleSignUp(event.email, event.password, event.context, event.key);
    }
  }

  _handleOnReady() {
    dispatchState(BlocStableState(data: null));
  }

  Future _handleSignUp (String email, String password, context, GlobalKey<FormState> key) async{
    if (key.currentState?.validate() ?? false) {
      try {
        await signUp.signUp(email, password);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Usuário criado com sucesso')));
      } on Exception catch (e) {

      }
    }
  }
}
