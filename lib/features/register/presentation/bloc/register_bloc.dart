import 'package:flutter/material.dart';
import 'package:project_glass/core/architecture/bloc/bloc.dart';
import 'package:project_glass/core/architecture/bloc/bloc_state.dart';
import 'package:project_glass/core/architecture/bloc/event.dart';
import 'package:project_glass/core/utils/string_translator.dart';
import 'package:project_glass/features/register/domain/usecases/signup_usecase.dart';
import 'package:project_glass/features/register/presentation/bloc/register_event.dart';

class RegisterBloc extends Bloc {
  final SignUpUsecase signUp;

  RegisterBloc(this.signUp);

  @override
  mapListenEvent(Event event) {
    if (event is RegisterOnReadyEvent) {
      _handleOnReady();
    } else if (event is SignUpEvent) {
      _handleSignUp(event.email, event.password, event.context, event.key);
    } else if (event is RegisterNavigatePop) {
      _handleNavigatePop(event.context);
    }
  }

  _handleOnReady() {
    dispatchState(BlocStableState(data: null));
  }

  Future _handleSignUp(
      String email, String password, context, GlobalKey<FormState> key) async {
    if (key.currentState?.validate() ?? false) {
      try {
        await signUp.signUp(email, password);

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuário criado com sucesso!')));
      } on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(StringTranslator.build(e.toString()))));
      }
    }
  }

  _handleNavigatePop(context) {
    Navigator.pop(context);
  }
}
