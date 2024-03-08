import 'package:bloc/bloc.dart';
import 'package:hurry_app/domain/model/delete_vertex_model.dart';
import 'package:hurry_app/domain/model/get_verteses_model.dart';
import 'package:hurry_app/token_model/token_model.dart';
import 'package:hurry_app/verteses/service/vertesesService.dart';
part 'verteses_event.dart';
part 'verteses_state.dart';

class VertesesBloc extends Bloc<VertesesEvent, VertesesState> {
  VertesesBloc() : super(VertesesInitial()) {
    on<VertesesEvent>((event, emit) async {
      emit(LoadingVerteses());

      List<ResultModel> temp = await ImpVertesesService().getVerteses();
      if (temp is List<ErrorModel>) {
        emit(ErrorFetchingVerteses());
      } else if (temp is List<GetVertesesModelResponse>) {
        emit(SuccessFetchingVerteses(
            getVertesesModelResponse: temp as List<GetVertesesModelResponse>));
      }
    });
    on<DeleteVertex>((event, emit) async {
      emit(LoadingVerteses());
      ResultModel tempp =
          await ImpVertesesService().DeleteVertex(event.intIndex);
      if (tempp is ErrorModel) {
        emit(ErrorFetchingVerteses());
      } else if (tempp is DeleteVertexModelResponse) {
        emit(SuccessDeletingVertex(
            deleteVertexModelResponse: tempp as DeleteVertexModelResponse));
      }
    });
  }
}
