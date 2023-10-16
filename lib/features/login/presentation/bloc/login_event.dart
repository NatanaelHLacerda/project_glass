import 'package:flutter/material.dart';
import 'package:project_glass/core/bloc/event.dart';

class LoginEvent extends Event {}

class LoginOnReadyEvent implements LoginEvent {}

class LoginNavigateFeatureUntilEvent implements LoginEvent {
  BuildContext context;

  LoginNavigateFeatureUntilEvent({required this.context});
}

class SignInEvent implements LoginEvent {
  final String email;
  final String password;
  final BuildContext context;
  final GlobalKey<FormState> key;

  SignInEvent({
    required this.email,
    required this.password,
    required this.context,
    required this.key,
  });
}
