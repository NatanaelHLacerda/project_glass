import 'package:flutter/material.dart';

class EditContactParams {
  final String name;
  final String phone;
  final String id;
  final int index;
  final GlobalKey<FormState> key;
  final BuildContext context;

  EditContactParams({
    required this.name,
    required this.phone,
    required this.id,
    required this.index,
    required this.key,
    required this.context,
  });
}