import 'package:flutter/material.dart';
import 'package:project_glass/core/architecture/bloc/bloc.dart';
import 'package:project_glass/core/architecture/bloc/bloc_state.dart';
import 'package:project_glass/core/architecture/bloc/event.dart';
import 'package:project_glass/features/splash/domain/usecases/crendetials_verification_usecase.dart';
import 'package:project_glass/features/splash/presentation/bloc/splash_event.dart';

class SplashBloc extends Bloc {
  final CredentialsVerificationUsecase credentialsVerificationUsecase;

  SplashBloc(
    this.credentialsVerificationUsecase,
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
        await credentialsVerificationUsecase.credentialsVerification();

    Navigator.pushNamedAndRemoveUntil(context, result, (route) => false);
  }

}
