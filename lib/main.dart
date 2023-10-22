import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_glass/core/routes/const_routes.dart';
import 'package:project_glass/core/routes/routes_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ConstRoutes constRoutes = ConstRoutes();
  runApp(MyApp(
    constRoutes: constRoutes,
  ));
}

class MyApp extends StatelessWidget {
  final ConstRoutes constRoutes;
  const MyApp({required this.constRoutes, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: RoutesBuilder.builder(constRoutes),
      initialRoute: constRoutes.splashView,
      debugShowCheckedModeBanner: false,
    );
  }
}
