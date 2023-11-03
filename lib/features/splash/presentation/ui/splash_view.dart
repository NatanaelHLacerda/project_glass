import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_glass/core/architecture/bloc/bloc_state.dart';
import 'package:project_glass/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:project_glass/features/splash/presentation/bloc/splash_event.dart';
import 'package:project_glass/features/splash/presentation/ui/splash_view_stable_state.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    bloc.dispatchEvent(SplashEventOnReady());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: bloc.state,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data is BlocStableState) {
                return SplashViewStableState(
                  bloc: bloc,
                );
              }
              return Container();
            } else {
              return Container();
            }
          })),
    );
  }
}
