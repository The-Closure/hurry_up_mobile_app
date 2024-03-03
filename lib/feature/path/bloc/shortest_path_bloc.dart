import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/shortest_path.dart';
import 'package:riide/core/domain/model/response_model/vertex.dart';
import 'package:riide/core/domain/service/post_service/shortest_path_service.dart';

part 'shortest_path_event.dart';
part 'shortest_path_state.dart';

class ShortestPathBloc extends Bloc<ShortestPathEvent, ShortestPathState> {
  int? selectedSourceIndex;
  int? selectedTargetIndex;

  ShortestPathBloc() : super(ShortestPathInitial()) {
    on<CreateNewPath>((event, emit) async {
      emit(LoadingToCreatePath());
      Model temp =
          await ShortestPathService().createShortPath(model: event.path);

      if (temp is ShortPathRespunseModel) {
        emit(SuccessToCreatePath(shortestPath: temp));
      } else if (temp is ErrorModel) {
        emit(
          ErrorInCreatePath(error: temp),
        );
        print(temp.error);
      } else {
        emit(ExcptionInCreatePath(excption: temp as ExcptionModel));
        print(temp.excption);
      }
    });
  }

  List<String> getVertexResult(
      {required List<VertexModel> vertex,
      required ShortPathRespunseModel shortPath}) {
    final List<String> result = [];

    // for (var item in vertex) {
    //   if (shortPath.shortPath.contains(item.id)) {
    //     result.add(item);
    //   }
    // }
    for (var item in shortPath.shortPath) {
      for (var v in vertex) {
        if (v.id == item) {
          result.add(v.name);

          break;
        } else if (item == -1) {
          result.add("تغيير الخط");
          break;
        }
      }
    }
    // shortPath.shortPath.forEach((element) {
    //   print(element.runtimeType);
    // });
    return result;
  }

  List<int> getVertexId(
      {required List<VertexModel> vertex,
      required ShortPathRespunseModel shortPath}) {
    final List<int> result = [];

    // for (var item in vertex) {
    //   if (shortPath.shortPath.contains(item.id)) {
    //     result.add(item);
    //   }
    // }
    for (var item in shortPath.shortPath) {
      for (var v in vertex) {
        if (v.id == item) {
          result.add(v.id);
          break;
        }
      }
    }
    // shortPath.shortPath.forEach((element) {
    //   print(element.runtimeType);
    // });
    return result;
  }
}
