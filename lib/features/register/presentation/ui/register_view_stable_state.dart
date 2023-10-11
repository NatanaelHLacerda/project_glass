import 'package:flutter/material.dart';
import 'package:project_glass/core/utils/form_builder_validator.dart';
import 'package:project_glass/features/register/presentation/bloc/register_bloc.dart';
import 'package:project_glass/features/register/presentation/bloc/register_event.dart';

class RegisterViewStableState extends StatefulWidget {
  final RegisterBloc bloc;
  const RegisterViewStableState({required this.bloc, super.key});

  @override
  State<RegisterViewStableState> createState() =>
      _RegisterViewStableStateState();
}

class _RegisterViewStableStateState extends State<RegisterViewStableState> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  bool visibily = true;

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
                controller: emailController,
                validator: (value) => FormBuilderValidator.emailValidate(value),
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: visibily,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        visibily = !visibily;

                        setState(() {});
                      },
                      icon: Icon(
                          visibily ? Icons.visibility : Icons.visibility_off)),
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      widget.bloc.dispatchEvent(
                      SignUpEvent(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context,
                        key: _globalKey,
                      ),
                    );
                    }, child: const Text('Registre-se')),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    
                  },
                  child: const Text('Faça Login'))
            ],
          ),
        ),
      ),
    );
  }
}
