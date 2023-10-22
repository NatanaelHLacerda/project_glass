import 'package:flutter/material.dart';
import 'package:project_glass/core/bloc/bloc_state.dart';
import 'package:project_glass/core/routes/const_routes.dart';
import 'package:project_glass/core/services/auth_service.dart';
import 'package:project_glass/features/splash/data/datasources/remote/splash_datasource_impl.dart';
import 'package:project_glass/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:project_glass/features/splash/domain/usecases/credentials_verification_usecase_impl.dart';
import 'package:project_glass/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:project_glass/features/splash/presentation/bloc/splash_event.dart';
import 'package:project_glass/features/splash/presentation/ui/splash_view_stable_state.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashBloc bloc = SplashBloc(
    CredentialsVerificationUsecaseImpl(SplashRepositoryImpl(
        SplashDataSourceImpl(auth: AuthService(), routes: ConstRoutes()))),
    
  );

  @override
  void initState() {
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
