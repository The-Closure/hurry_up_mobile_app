import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/add_busline.dart';
import 'package:riide/core/domain/model/response_model/busline.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class StoreBuslineService extends Service {
  Future<Model> storeBusline({required BuslineModel model}) async {
    try {
      response = await dio.post(Url().baseUrl + Url().admin + Url().busline,
          data: model.toJson());

      print(response);

      if (response.statusCode == 200) {
        dynamic temp = response.data;
        BuslineResponseModel result = BuslineResponseModel.fromMap(temp);
        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}
