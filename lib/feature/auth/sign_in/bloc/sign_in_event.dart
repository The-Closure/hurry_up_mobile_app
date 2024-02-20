part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class Login extends SignInEvent {
  LoginModel user;
  Login({required this.user});
}
