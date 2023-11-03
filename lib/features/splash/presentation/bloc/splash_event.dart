import 'package:flutter/material.dart';
import 'package:project_glass/core/architecture/bloc/event.dart';

class SplashEvent extends Event {}

class SplashEventOnReady implements SplashEvent {}

class SplashEventCredentialsVerification implements SplashEvent {
  final BuildContext context;

  SplashEventCredentialsVerification(this.context);
}

class SplashEventLogoutUser implements SplashEvent {
  final BuildContext context;

  SplashEventLogoutUser(this.context);
}
