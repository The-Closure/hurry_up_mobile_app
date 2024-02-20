part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

class SuccessInLogin extends SignInState {}

class ErrorInLogin extends SignInState {
  ErrorModel error;
  ErrorInLogin({required this.error});
}

class ExcptionInLogin extends SignInState {
  ExcptionModel excption;
  ExcptionInLogin({required this.excption});
}

class LoadingToLogin extends SignInState {}
