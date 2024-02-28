import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/shortest_path.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class ShortestPathService extends Service {
  Future<Model> createShortPath({required ShortestPathModel model}) async {
    try {
      response = await dio.post(Url().baseUrl + Url().shortestPath,
          data: model.toJson(), options: options);
      if (response.statusCode == 200) {
        dynamic temp = response.data;

        ShortPathRespunseModel result = ShortPathRespunseModel(shortPath: temp);
        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}
