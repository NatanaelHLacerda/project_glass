import 'package:get_it/get_it.dart';
import 'package:project_glass/core/routes/const_routes.dart';
import 'package:project_glass/core/services/auth_service.dart';
import 'package:project_glass/core/services/database_service.dart';
import 'package:project_glass/features/home/data/datasources/home_datasources.dart';
import 'package:project_glass/features/home/data/datasources/remote/home_datasources_impl.dart';
import 'package:project_glass/features/home/data/repositories/home_repository_impl.dart';
import 'package:project_glass/features/home/domain/repositories/home_repository.dart';
import 'package:project_glass/features/home/domain/usecases/add_contact_usecase.dart';
import 'package:project_glass/features/home/domain/usecases/add_contact_usecase_impl.dart';
import 'package:project_glass/features/home/domain/usecases/edit_contact_usecase.dart';
import 'package:project_glass/features/home/domain/usecases/edit_contact_usecase_impl.dart';
import 'package:project_glass/features/home/domain/usecases/get_contacts_usecase.dart';
import 'package:project_glass/features/home/domain/usecases/get_contacts_usecase_impl.dart';
import 'package:project_glass/features/home/domain/usecases/logout_user_usecase.dart';
import 'package:project_glass/features/home/domain/usecases/logout_user_usecase_impl.dart';
import 'package:project_glass/features/home/domain/usecases/remove_contact_usecase.dart';
import 'package:project_glass/features/home/domain/usecases/remove_contact_usecase_impl.dart';
import 'package:project_glass/features/home/presentation/bloc/home_bloc.dart';
import 'package:project_glass/features/login/data/datasources/login_datasources.dart';
import 'package:project_glass/features/login/data/datasources/remote/login_datasources_impl.dart';
import 'package:project_glass/features/login/data/repositories/login_repository_impl.dart';
import 'package:project_glass/features/login/domain/repositories/login_repository.dart';
import 'package:project_glass/features/login/domain/usecases/signin_usecase.dart';
import 'package:project_glass/features/login/domain/usecases/signin_usecase_impl.dart';
import 'package:project_glass/features/login/presentation/bloc/login_bloc.dart';
import 'package:project_glass/features/register/data/datasources/register_datasources.dart';
import 'package:project_glass/features/register/data/datasources/remote/register_datasources_impl.dart';
import 'package:project_glass/features/register/data/repositories/register_repository_impl.dart';
import 'package:project_glass/features/register/domain/repositories/register_repository.dart';
import 'package:project_glass/features/register/domain/usecases/signup_usecase.dart';
import 'package:project_glass/features/register/domain/usecases/signup_usecase_impl.dart';
import 'package:project_glass/features/register/presentation/bloc/register_bloc.dart';
import 'package:project_glass/features/splash/data/datasources/remote/splash_datasource_impl.dart';
import 'package:project_glass/features/splash/data/datasources/splash_datasource.dart';
import 'package:project_glass/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:project_glass/features/splash/domain/repository/splash_repository.dart';
import 'package:project_glass/features/splash/domain/usecases/credentials_verification_usecase_impl.dart';
import 'package:project_glass/features/splash/domain/usecases/crendetials_verification_usecase.dart';
import 'package:project_glass/features/splash/presentation/bloc/splash_bloc.dart';

class AppInjector {
  static initialize() {
    GetIt getIt = GetIt.instance;

    // Core
    getIt.registerLazySingleton(() => ConstRoutes());
    getIt.registerLazySingleton(() => AuthService());
    getIt.registerLazySingleton(() => DatabaseService());

    // Datasource
    getIt.registerLazySingleton<SplashDataSource>(
        () => SplashDataSourceImpl(getIt(), getIt()));
    getIt.registerLazySingleton<LoginDatasources>(
        () => LoginDatasourcesImpl(getIt()));
    getIt.registerLazySingleton<RegisterDataSources>(
        () => RegisterDatasourcesImpl(getIt(), getIt()));
    getIt.registerLazySingleton<HomeDataSources>(
        () => HomeDataSourcesImpl(getIt(), getIt(), getIt()));

    // Repositories
    getIt.registerLazySingleton<SplashRepository>(
        () => SplashRepositoryImpl(getIt()));
    getIt.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(getIt()));
    getIt.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(getIt()));
    getIt.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(getIt()));

    // Usecases

    getIt.registerLazySingleton<CredentialsVerificationUsecase>(
        () => CredentialsVerificationUsecaseImpl(getIt()));

    getIt
        .registerLazySingleton<SignInUsecase>(() => SignInUsecaseImpl(getIt()));

    getIt
        .registerLazySingleton<SignUpUsecase>(() => SignUpUseCaseImpl(getIt()));

    getIt.registerLazySingleton<AddContactUsecase>(
        () => AddContactUsecaseImpl(getIt()));
    getIt.registerLazySingleton<EditContactUsecase>(
        () => EditContactUsecaseImpl(getIt()));
    getIt.registerLazySingleton<GetContactsUsecase>(
        () => GetContactsUsecaseImpl(getIt()));
    getIt.registerLazySingleton<LogoutUserUsecase>(
        () => LogoutUserUsecaseImpl(getIt()));
    getIt.registerLazySingleton<RemoveContactUsecase>(
        () => RemoveContactUsecaseImpl(getIt()));

    // Bloc
    getIt.registerFactory(() => SplashBloc(getIt()));
    getIt.registerFactory(() => LoginBloc(getIt()));
    getIt.registerFactory(() => RegisterBloc(getIt()));
    getIt.registerFactory(
        () => HomeBloc(getIt(), getIt(), getIt(), getIt(), getIt()));
  }
}
