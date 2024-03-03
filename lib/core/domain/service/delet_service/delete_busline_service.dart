import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/delete_busline.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class DeleteBuslineService extends Service {
  Future<Model> deleteTheBusline({required DeleteBuslineModel model}) async {
    try {
      response = await dio.delete(Url().baseUrl + Url().admin + Url().busline,
          data: model.toJson());

      if (response.statusCode == 200) {
        dynamic temp = response.data;
        DeleteBuslineResponseModel result =
            DeleteBuslineResponseModel.fromMap(temp);
        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}
