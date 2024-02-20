// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class CreateAnAccount extends SignUpEvent {
  RegisterModel user;
  CreateAnAccount({required this.user});
}
