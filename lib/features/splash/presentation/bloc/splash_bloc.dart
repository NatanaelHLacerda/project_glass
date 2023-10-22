import 'package:flutter/material.dart';
import 'package:project_glass/core/bloc/bloc.dart';
import 'package:project_glass/core/bloc/bloc_state.dart';
import 'package:project_glass/core/bloc/event.dart';
import 'package:project_glass/features/splash/domain/usecases/credentials_verification_usecase_impl.dart';
import 'package:project_glass/features/splash/presentation/bloc/splash_event.dart';

class SplashBloc extends Bloc {
  final CredentialsVerificationUsecaseImpl credentialsVerificationUsecaseImpl;

  SplashBloc(
    this.credentialsVerificationUsecaseImpl,
  );

  @override
  mapListenEvent(Event event) {
    if (event is SplashEventOnReady) {
      _handleOnReady();
    } else if (event is SplashEventCredentialsVerification) {
      _handleCredentialsVerification(event.context);
    }
  }

  _handleOnReady() {
    dispatchState(BlocStableState(data: null));
  }

  Future _handleCredentialsVerification(BuildContext context) async {
    final result =
        await credentialsVerificationUsecaseImpl.credentialsVerification();

    Navigator.pushNamedAndRemoveUntil(context, result, (route) => false);
  }

}
