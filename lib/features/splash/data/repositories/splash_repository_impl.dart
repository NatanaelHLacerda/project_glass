import 'package:project_glass/features/splash/data/datasources/splash_datasource.dart';
import 'package:project_glass/features/splash/domain/repository/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository{

  SplashDataSource dataSource;

  SplashRepositoryImpl(this.dataSource);

  @override
  Future credentialsVerification() {
    return dataSource.credentialsVerification();
  }

}