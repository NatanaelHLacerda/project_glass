import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_glass/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:project_glass/features/splash/presentation/bloc/splash_event.dart';

class SplashViewStableState extends StatefulWidget {
  final SplashBloc bloc;
  const SplashViewStableState({super.key, required this.bloc});

  @override
  State<SplashViewStableState> createState() => _SplashViewStableStateState();
}

class _SplashViewStableStateState extends State<SplashViewStableState> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        widget.bloc.dispatchEvent(SplashEventCredentialsVerification(context)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lotties/splash_lottie.json'),
    );
  }
}
