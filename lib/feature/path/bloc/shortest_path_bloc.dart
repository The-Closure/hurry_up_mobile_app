import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/shortest_path.dart';
import 'package:riide/core/domain/service/post_service/shortest_path_service.dart';

part 'shortest_path_event.dart';
part 'shortest_path_state.dart';

class ShortestPathBloc extends Bloc<ShortestPathEvent, ShortestPathState> {
  ShortestPathBloc() : super(ShortestPathInitial()) {
    on<CreateNewPath>((event, emit) async {
      emit(LoadingToCreatePath());
      Model temp =
          await ShortestPathService().createShortPath(model: event.path);

      if (temp is ShortPathRespunseModel) {
        emit(SuccessToCreatePath());
      } else if (temp is ErrorModel) {
        emit(
          ErrorInCreatePath(error: temp),
        );
      } else {
        emit(ExcptionInCreatePath(excption: temp as ExcptionModel));
      }
    });
  }
}
