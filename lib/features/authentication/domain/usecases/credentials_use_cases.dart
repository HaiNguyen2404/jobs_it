import 'package:jobs_it/app/usecase/usecase.dart';
import 'package:jobs_it/features/authentication/data/models/credentials.dart';
import 'package:jobs_it/features/authentication/domain/repository/auth_repository.dart';

class SaveCredentialsUseCase extends Usecase<void, Credentials> {
  final AuthRepository repository;

  SaveCredentialsUseCase(this.repository);

  @override
  Future<void> call({Credentials? param}) async {
    await repository.saveCredentials(param!);
  }
}

class GetCredentialsUseCase extends Usecase<Credentials?, void> {
  final AuthRepository repository;

  GetCredentialsUseCase(this.repository);

  @override
  Future<Credentials?> call({void param}) async {
    return await repository.getCredentials();
  }
}

class DeleteCredentialsUseCase extends Usecase<void, void> {
  final AuthRepository repository;

  DeleteCredentialsUseCase(this.repository);

  @override
  Future<void> call({void param}) async {
    await repository.deleteCredentials();
  }
}
