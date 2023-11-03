import 'package:project_glass/core/routes/const_routes.dart';
import 'package:project_glass/core/services/auth_service.dart';
import 'package:project_glass/features/splash/data/datasources/splash_datasource.dart';

class SplashDataSourceImpl implements SplashDataSource {
  final AuthService authService;

  final ConstRoutes routes;
  SplashDataSourceImpl(
    this.authService,
    this.routes,
  );

  @override
  Future credentialsVerification() async{
    if (authService.instance.currentUser != null) {
      return routes.homeView;
    } else {
      return routes.loginView;
    }
  }

}
