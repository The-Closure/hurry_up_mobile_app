// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackEvent {}

class GiveFeedback extends FeedbackEvent {
  FeedbackModel feedback;
  GiveFeedback({required this.feedback});
}
