import 'package:dio/dio.dart';
import 'package:hurry_app/domain/model/get_busLine_model.dart';
import 'package:hurry_app/domain/model/store_busLine_model.dart';
import 'package:hurry_app/domain/services/base_service.dart';
import 'package:hurry_app/token_model/token_model.dart';

List<GetBusLinesModelResponse> getBusLinesModelResponse = [];

class ImpGetBusLinesService extends BaseService {
  Future<List<ResultModel>> GetBusLines() async {
    try {
      Response response = await dio.get(
        '$authUrl/admin/busline',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.data);
        dynamic temp = response.data;
        List<GetBusLinesModelResponse> result = List.generate(temp.length,
            (index) => GetBusLinesModelResponse.fromMap(temp[index]));
        print(result);
        getBusLinesModelResponse = result;
        return result;
      } else {
        print('else service');
        // print(response.statusMessage);
        List<ErrorModel> temp = [ErrorModel(messaeg: 'Error')];
        return temp;
      }
    } catch (e) {
      print('exception');
      String exc = e.toString();
      print(exc);
      List<ErrorModel> temp = [ErrorModel(messaeg: exc)];
      return temp;
    }
  }
}
