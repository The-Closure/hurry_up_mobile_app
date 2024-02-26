part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoadingAuthState extends AuthState {}

//Signup
class SuccessToSignupAuthState extends AuthState {}

class ErrorInSignupAuthState extends AuthState {}

//Signin
class SuccessToSgininAuthState extends AuthState {}

class ErrorInSigninAuthState extends AuthState {
  ErrorModel error;
  ErrorInSigninAuthState({required this.error});
}