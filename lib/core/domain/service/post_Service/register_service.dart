import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/register.dart';
import 'package:riide/core/domain/model/token_model.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';

class RegisterService extends Service {
  Future<Model> signUp({required RegisterModel model}) async {
    try {
      response =
          await dio.post(Url().baseUrl + Url().registerUrl, data: model.toJson());
      if (response.statusCode == 200) {
        dynamic temp = response.data;
        // RegisterModel result = RegisterModel.fromMap(temp);
        TokenModel result = TokenModel(token: temp);
        return result;
        // return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}
