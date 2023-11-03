import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_glass/application.dart';
import 'package:project_glass/core/architecture/injector/app_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppInjector.initialize();
  runApp(const Application());
}

