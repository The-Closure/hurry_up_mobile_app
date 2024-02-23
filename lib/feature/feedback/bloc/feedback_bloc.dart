import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/feedback.dart';
import 'package:riide/core/domain/service/post_service/feedback_service.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(FeedbackInitial()) {
    on<GiveFeedback>((event, emit) async {
      emit(LoadingToFeedback());
      Model temp = await FeedbackService().feedback(model: event.feedback);
      if (temp is FeedbackModel) {
        emit(SuccessFeedback());
      } else if (temp is ErrorModel) {
        emit(ErrorFeedback(error: temp));
      } else {
        emit(ExcptionFeedback(excption: temp as ExcptionModel));
      }
    });
  }
}
