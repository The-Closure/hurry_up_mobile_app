// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackState {}

final class FeedbackInitial extends FeedbackState {}

class SuccessFeedback extends FeedbackState {}

class ErrorFeedback extends FeedbackState {
  ErrorModel error;
  ErrorFeedback({required this.error});
}

class ExcptionFeedback extends FeedbackState {
  ExcptionModel excption;
  ExcptionFeedback({required this.excption});
}

class LoadingToFeedback extends FeedbackState {}
