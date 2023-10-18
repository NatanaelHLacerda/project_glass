import 'package:flutter/cupertino.dart';

class ContactParams {
  final String nome;
  final String phone;
  final GlobalKey<FormState> key;
  final BuildContext context;

  ContactParams({
    required this.nome,
    required this.phone,
    required this.key,
    required this.context,
  });
}