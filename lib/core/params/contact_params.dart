import 'package:flutter/cupertino.dart';

class BudgetParams {
  final String nome;
  final String phone;
  final GlobalKey<FormState> key;
  final BuildContext context;

  BudgetParams({
    required this.nome,
    required this.phone,
    required this.key,
    required this.context,
  });
}