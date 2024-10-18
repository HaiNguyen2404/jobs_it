part of 'button_cubit.dart';

abstract class ButtonState {}

class ButtonInitialState extends ButtonState {}

class ButtonLoadingState extends ButtonState {}

class ButtonSuccessState extends ButtonState {
  final User user;

  ButtonSuccessState(this.user);
}

class ButtonFailureState extends ButtonState {
  final String errorMessage;

  ButtonFailureState(this.errorMessage);
}
