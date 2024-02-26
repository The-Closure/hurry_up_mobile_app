part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

//Singup
class SignupEvent extends AuthEvent {
  RegisterModel user;
  SignupEvent({required this.user});
}

//Singin
class SignInEvent extends AuthEvent {
  LoginModel user;
  SignInEvent({required this.user});
}