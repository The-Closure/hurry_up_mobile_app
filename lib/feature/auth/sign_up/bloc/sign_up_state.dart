// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

class SuccessCreateAnAccount extends SignUpState {}

class ErrorInCreateAnAccount extends SignUpState {
  ErrorModel error;
  ErrorInCreateAnAccount({required this.error});
}

class ExcptionInCreateAnAccount extends SignUpState {
  ExcptionModel excption;
  ExcptionInCreateAnAccount({required this.excption});
}

class LoadingCreateAnAccount extends SignUpState {}
