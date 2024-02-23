import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/list_model.dart';
import 'package:riide/core/domain/model/request_model/history.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class HistoryService extends Service {
  /*Future<Model> */ getHistory() async {
    try {
      response = await dio.get(Url().baseUrl + Url().history);

      print(response);

      if (response.statusCode == 200) {
        dynamic temp = response.data;

        // List<HistoryModel> result = List.generate(
        //   temp.length,
        //   (index) => HistoryModel.fromMap(temp[index]),
        // );
        // ListModel history = ListModel(listOfModel: result);

        // return history;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}
