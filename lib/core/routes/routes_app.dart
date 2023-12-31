import 'package:project_glass/core/routes/const_routes.dart';
import 'package:project_glass/features/budgets/presentation/ui/budgets_view.dart';
import 'package:project_glass/features/splash/presentation/ui/splash_view.dart';
import 'package:project_glass/features/login/presentation/ui/login_view.dart';
import 'package:project_glass/features/register/presentation/ui/register_view.dart';

class RoutesApp {
  static builder (ConstRoutes routes){
    return {
      routes.loginView: (_) => const LoginView(),
      routes.registerView: (_) => const RegisterView(),
      routes.budgetsView: (_) => const BudgetsView(),
      routes.splashView: (_) => const SplashView(),
    };
  }
}