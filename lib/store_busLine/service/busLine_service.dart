import 'package:dio/dio.dart';
import 'package:hurry_app/domain/model/store_busLine_model.dart';
import 'package:hurry_app/domain/services/base_service.dart';
import 'package:hurry_app/token_model/token_model.dart';

class ImpBusLineService extends BaseService {
  Future<ResultModel> storeBusline(Map<String, Object> deta) async {
    try {
      Response response = await dio.post('$authUrl/admin/busline',
          options: Options(method: 'Post'), data: deta);
      // print('object');
      // print('service \n $response.data');
      // print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print('service');
        // print(json.encode(response.data));
        // ErrorModel errorModel = ErrorModel.fromMap(response.data);
        // print(response.data);
        StoreBusLineModelResponse result =
            StoreBusLineModelResponse.fromMap(response.data);
        print(response.data);

        return result;
      } else {
        print('else service');
        // print(response.statusMessage);
        ErrorModel result = ErrorModel(messaeg: 'Error');
        return result;
      }
    } catch (e) {
      String exc = e.toString();
      ErrorModel result = ErrorModel(messaeg: exc);
      return result;
    }
  }
}
