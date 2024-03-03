import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/list_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/busline.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class BuslineService extends Service {
  Future<Model> getHistoryBusline() async {
    try {
      response = await dio.get(Url().baseUrl + Url().admin + Url().busline);

      print(response);

      if (response.statusCode == 200) {
        dynamic temp = response.data;

        List<BuslineModel> result = List.generate(
          temp.length,
          (index) => BuslineModel.fromMap(temp[index]),
        );
        ListModel busline = ListModel(listOfModel: result);

        return busline;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}
