import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/request_model/delete_vertex.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class DeleteVerticeService extends Service {
  Future<Model> deleteTheVertice({required DeleteVertexModel model}) async {
    try {
      response = await dio.delete(Url().baseUrl + Url().admin + Url().vertices,
          data: model.toJson);

      if (response.statusCode == 200) {
        dynamic temp = response.data;
        DeleteVertexResponseModel result =
            DeleteVertexResponseModel.fromMap(temp);
        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}
