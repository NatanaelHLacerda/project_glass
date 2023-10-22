import 'package:project_glass/features/splash/domain/repository/splash_repository.dart';
import 'package:project_glass/features/splash/domain/usecases/crendetials_verification_usecase.dart';

class CredentialsVerificationUsecaseImpl
    implements CredentialsVerificationUsecase {
  final SplashRepository repository;

  CredentialsVerificationUsecaseImpl(this.repository);

  @override
  Future credentialsVerification() {
    return repository.credentialsVerification();
  }
}
