import 'package:flutter/material.dart';
import 'package:project_glass/core/bloc/bloc.dart';
import 'package:project_glass/core/bloc/bloc_state.dart';
import 'package:project_glass/core/bloc/event.dart';
import 'package:project_glass/core/utils/string_translator.dart';
import 'package:project_glass/features/home/presentation/ui/home_view.dart';
import 'package:project_glass/features/login/domain/usecases/signin_usecase_impl.dart';
import 'package:project_glass/features/login/presentation/bloc/login_event.dart';

class LoginBloc extends Bloc {
  SignInUsecaseImpl signInUsecaseImpl;

  LoginBloc(
    this.signInUsecaseImpl,
  );

  @override
  mapListenEvent(Event event) {
    if (event is LoginOnReadyEvent) {
      _handleOnReady();
    } else if (event is LoginNavigateFeatureUntilEvent) {
      _handleNavigateUntilFeature(event.context);
    } else if (event is SignInEvent) {
      _handleSignIn(event.email, event.password, event.context, event.key);
    }
  }

  _handleOnReady() {
    dispatchState(BlocStableState(data: null));
  }

  Future _handleSignIn(
      String email, String password, context, GlobalKey<FormState> key) async {
    if (key.currentState?.validate() ?? false) {
      try {
        await signInUsecaseImpl.signIn(email, password);

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuario logado com sucesso!')));

        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => const HomeView())));
      } on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(StringTranslator.build(e.toString()))));
      }
    }
  }

  _handleNavigateUntilFeature(context) {
    Navigator.of(context).pushNamed('/register');
  }
}
