import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/complete_the_order.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class CompleteOrderService extends Service {
  Future<Model> complete({required CompleteOrderModel model}) async {
    try {
      response = await dio.post(Url().baseUrl + Url().completeTheOrder,
          data: model.toJson(), options: options);

      print(response);

      if (response.statusCode == 200) {
        dynamic temp = response.data;
        CompleteOrderResponseModel result =
            CompleteOrderResponseModel.fromMap(temp);
        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}
