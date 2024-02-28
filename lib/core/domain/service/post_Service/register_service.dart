import 'package:riide/core/config/get_it.dart';
import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/register.dart';
import 'package:riide/core/domain/model/token_model.dart';
import 'package:riide/core/domain/service/service.dart';
import 'package:riide/core/resources/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService extends Service {
  Future<Model> signUp({required RegisterModel model}) async {
    try {
      response = await dio.post(Url().baseUrl + Url().registerUrl,
          data: model.toJson());

      print(response);
      if (response.statusCode == 201) {
        dynamic temp = response.data;

        TokenModel result = TokenModel.fromMap(temp);
        config.get<SharedPreferences>().setString('token', result.token);
        print(result);
        return result;
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}
