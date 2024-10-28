import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobs_it/app/constants/api_urls.dart';
import 'package:jobs_it/app/di/service_locator.dart';
import 'package:jobs_it/app/network/dio_client.dart';
import 'package:jobs_it/features/authentication/data/models/sign_in_request.dart';
import 'package:jobs_it/features/authentication/data/models/user_model.dart';

import '../models/register_request.dart';

abstract class AuthApiService {
  Future<Either> register(RegisterRequest request);
  Future<Either> signIn(SignInRequest request);
  Future<UserModel?> getUser();
  Future<void> updateUser(UserModel user);
  Future<void> forgetPassword(String email);
  Future<void> changePassword(String password, String newPassword);
}

class AuthApiServiceImpl implements AuthApiService {
  String token = '';

  @override
  Future<Either> register(RegisterRequest request) async {
    try {
      var response = await locator<DioClient>().post(
        ApiUrls.register,
        data: request.toJson(),
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  @override
  Future<Either> signIn(SignInRequest request) async {
    try {
      var response = await locator<DioClient>().post(
        ApiUrls.signIn,
        data: request.toJson(),
      );

      token = response.data;

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['details']);
    }
  }

  @override
  Future<UserModel?> getUser() async {
    if (token == '') {
      return null;
    }

    final response = await locator<DioClient>().get(
      ApiUrls.authMe,
    );

    if (response.statusCode != 200) {
      return null;
    }

    final data = response.data;

    return UserModel.fromJson(data);
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await locator<DioClient>().patch(
      ApiUrls.authMe,
      data: user.toJson(),
    );
  }

  @override
  Future<void> forgetPassword(String email) async {
    await locator<DioClient>().post(
      ApiUrls.authMe,
      data: email,
    );
  }

  @override
  Future<void> changePassword(String password, String newPassword) async {
    UserModel? currentUser = await getUser();
    if (currentUser == null) {
      return;
    }

    await locator<DioClient>().post(
      ApiUrls.authMe,
      data: {
        'email': currentUser.email,
        'password': password,
        'newPassword': newPassword,
      },
    );
  }
}
