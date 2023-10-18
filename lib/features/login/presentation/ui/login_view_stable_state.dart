import 'package:flutter/material.dart';
import 'package:project_glass/core/utils/form_builder_validator.dart';
import 'package:project_glass/features/login/presentation/bloc/login_bloc.dart';
import 'package:project_glass/features/login/presentation/bloc/login_event.dart';

class LoginViewStableState extends StatefulWidget {
  final LoginBloc bloc;
  const LoginViewStableState({required this.bloc, super.key});

  @override
  State<LoginViewStableState> createState() => _LoginViewStableStateState();
}

class _LoginViewStableStateState extends State<LoginViewStableState> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool visibility = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) => FormBuilderValidator.emailValidate(value),
                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'E-mail'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: visibility,
                validator: (value) =>
                    FormBuilderValidator.passwordValidate(value),
                controller: passwordController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          visibility = !visibility;
                          setState(() {});
                        },
                        icon: Icon(visibility
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Senha'),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                    onPressed: () {
                      widget.bloc.dispatchEvent(
                        SignInEvent(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context,
                          key: _globalKey,
                        ),
                      );
                    },
                    child: const Text('Logar')),
              ),
              TextButton(
                onPressed: () {
                  widget.bloc.dispatchEvent(
                      LoginNavigateFeatureUntilEvent(context: context));
                },
                child: const Text('Crie uma conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
