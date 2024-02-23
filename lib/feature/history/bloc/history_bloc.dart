import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/list_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/request_model/history.dart';
import 'package:riide/core/domain/service/get_service/history_service.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<GitAllHistory>((event, emit) async {
      emit(LoadingToHistory());
      Model temp = await HistoryService().getHistory();

      if (temp is ListModel) {
        emit(SuccessGetHistory(history: temp ));
      } else if (temp is ErrorModel) {
        emit(ErrorInGettingHistory(error: temp));
      } else {
        emit(ExcptionInGettingHistory(excption: temp as ExcptionModel));
      }
    });
  }
}
