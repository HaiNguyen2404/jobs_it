import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_it/features/authentication/data/models/register_request.dart';
import 'package:jobs_it/features/authentication/data/models/sign_in_request.dart';
import 'package:jobs_it/features/authentication/domain/usecases/auth_use_cases.dart';
import 'package:jobs_it/features/authentication/domain/usecases/credentials_use_cases.dart';

import '../../data/models/credentials.dart';
import '../../domain/entities/user.dart';
part 'package:jobs_it/features/authentication/presentation/bloc/button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  final RegisterUseCase registerUseCase;
  final SignInUseCase signInUseCase;
  final GetUserUseCase getUserUseCase;
  final SaveCredentialsUseCase saveCredentialsUseCase;
  final GetCredentialsUseCase getCredentialsUseCase;
  final DeleteCredentialsUseCase deleteCredentialsUseCase;

  ButtonCubit(
    this.registerUseCase,
    this.signInUseCase,
    this.getUserUseCase,
    this.saveCredentialsUseCase,
    this.getCredentialsUseCase,
    this.deleteCredentialsUseCase,
  ) : super(ButtonInitialState());

  register(RegisterRequest param) async {
    try {
      Either result = await registerUseCase.call(param: param);

      result.fold(
        (error) => emit(ButtonFailureState(error)),
        (data) => signIn(
          SignInRequest(
            username: param.username,
            password: param.password,
          ),
        ),
      );
    } catch (e) {
      emit(ButtonFailureState(e.toString()));
    }
  }

  signIn(SignInRequest param) async {
    try {
      final result = await signInUseCase.call(param: param);

      result.fold(
        (error) => emit(ButtonFailureState(error)),
        (data) => getUser(),
      );
    } catch (e) {
      emit(ButtonFailureState(e.toString()));
    }
  }

  getUser() async {
    User? user = await getUserUseCase.call();
    if (user == null) {
      emit(ButtonInitialState());
    } else {
      emit(ButtonSuccessState(user));
    }
  }

  saveCredentials(Credentials credentials) async {
    await saveCredentialsUseCase.call(param: credentials);
  }

  Future<Credentials?> getCredentials() async {
    return await getCredentialsUseCase.call();
  }

  deleteCredentials() async {
    await deleteCredentialsUseCase.call();
  }
}
