import 'package:dartz/dartz.dart';
import 'package:jobs_it/features/authentication/data/data_source/auth_api_service.dart';
import 'package:jobs_it/features/authentication/data/data_source/hive_credentials_storage.dart';
import 'package:jobs_it/features/authentication/data/models/credentials.dart';
import 'package:jobs_it/features/authentication/data/models/sign_in_request.dart';
import 'package:jobs_it/features/authentication/data/models/user_model.dart';
import 'package:jobs_it/features/authentication/domain/entities/user.dart';
import 'package:jobs_it/features/authentication/domain/repository/auth_repository.dart';

import '../models/register_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService apiService;
  final HiveCredentialsStorage storage;

  AuthRepositoryImpl(this.apiService, this.storage);

  @override
  Future<Either> register(RegisterRequest request) async {
    return await apiService.register(request);
  }

  @override
  Future<Either> signIn(SignInRequest request) async {
    return await apiService.signIn(request);
  }

  @override
  Future<UserModel?> getUser() async {
    return await apiService.getUser();
  }

  @override
  Future<void> saveCredentials(Credentials credentials) async {
    await storage.saveCredentials(credentials.username, credentials.password);
  }

  @override
  Future<Credentials?> getCredentials() async {
    final credentialsData = await storage.getCredentials();
    if (credentialsData != null) {
      return Credentials(
        username: credentialsData['username']!,
        password: credentialsData['password']!,
      );
    }
    return null;
  }

  @override
  Future<void> deleteCredentials() async {
    await storage.deleteCredentials();
  }

  @override
  Future<void> updateUser(User user) async {
    await apiService.updateUser(UserModel.fromEntity(user));
  }

  @override
  Future<void> forgetPassword(String email) async {
    await apiService.forgetPassword(email);
  }

  @override
  Future<void> changePassword(String password, String newPassword) async {
    await apiService.changePassword(password, newPassword);
  }
}
