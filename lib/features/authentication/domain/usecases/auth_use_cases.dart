import 'package:dartz/dartz.dart';
import 'package:jobs_it/app/usecase/usecase.dart';
import 'package:jobs_it/features/authentication/data/models/register_request.dart';
import 'package:jobs_it/features/authentication/data/models/sign_in_request.dart';
import 'package:jobs_it/features/authentication/domain/repository/auth_repository.dart';

import '../entities/user.dart';

class RegisterUseCase implements Usecase<Either, RegisterRequest> {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  @override
  Future<Either> call({RegisterRequest? param}) async {
    return authRepository.register(param!);
  }
}

class SignInUseCase implements Usecase<Either, SignInRequest> {
  final AuthRepository authRepository;

  SignInUseCase(this.authRepository);

  @override
  Future<Either> call({SignInRequest? param}) async {
    return await authRepository.signIn(param!);
  }
}

class GetUserUseCase implements Usecase<User?, void> {
  final AuthRepository authRepository;

  GetUserUseCase(this.authRepository);

  @override
  Future<User?> call({void param}) async {
    return authRepository.getUser();
  }
}

class UpdateUserUseCase implements Usecase<void, User> {
  final AuthRepository authRepository;

  UpdateUserUseCase(this.authRepository);

  @override
  Future<void> call({User? param}) async {
    await authRepository.updateUser(param!);
  }
}
