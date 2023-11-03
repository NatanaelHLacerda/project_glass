import 'package:flutter/material.dart';
import 'package:project_glass/core/routes/const_routes.dart';
import 'package:project_glass/core/routes/routes_app.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final ConstRoutes routes = ConstRoutes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: RoutesApp.builder(routes),
      initialRoute: routes.splashView,
      debugShowCheckedModeBanner: false,
    );
  }
}