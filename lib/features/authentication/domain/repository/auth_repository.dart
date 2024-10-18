import 'package:dartz/dartz.dart';
import 'package:jobs_it/features/authentication/data/models/credentials.dart';
import 'package:jobs_it/features/authentication/data/models/register_request.dart';
import 'package:jobs_it/features/authentication/data/models/sign_in_request.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either> register(RegisterRequest request);
  Future<Either> signIn(SignInRequest request);
  Future<User?> getUser();
  Future<void> saveCredentials(Credentials credentials);
  Future<Credentials?> getCredentials();
  Future<void> deleteCredentials();
}
