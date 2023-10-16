import 'package:flutter/material.dart';
import 'package:project_glass/core/bloc/event.dart';

class RegisterEvent extends Event {}

class RegisterOnReadyEvent implements RegisterEvent {}

class SignUpEvent implements RegisterEvent {
  final String email;
  final String password;
  final BuildContext context;
  final GlobalKey<FormState> key;

  SignUpEvent(
      {required this.email,
      required this.password,
      required this.context,
      required this.key});
}

class RegisterNavigatePop implements Event {
  final BuildContext context;

  RegisterNavigatePop({required this.context});
}
