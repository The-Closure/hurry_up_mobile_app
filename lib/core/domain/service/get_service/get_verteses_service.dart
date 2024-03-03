import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/list_model.dart';
import 'package:riide/core/domain/model/response_model/vertex.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class GetVerticesService extends Service {
  /*Future<Model>*/ getVertices() async {
    try {
      response = await dio.get(Url().baseUrl + Url().admin + Url().vertices);

      print(response);

      if (response.statusCode == 200) {
        dynamic temp = response.data;

        List<VertexModel> result = List.generate(
          temp.length,
          (index) => VertexModel.fromMap(temp[index]),
        );
        ListModel vertex = ListModel(listOfModel: result);

        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}
