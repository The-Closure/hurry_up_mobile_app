import 'package:riide/core/domain/model/error_model.dart';
import 'package:riide/core/domain/model/excption_model.dart';
import 'package:riide/core/domain/model/model.dart';
import 'package:riide/core/domain/model/response_model/login.dart';
import 'package:riide/core/domain/model/token_model.dart';
import 'package:riide/core/domain/service/service.dart';

class LoginService extends Service {
  Future<Model /*dynamic*/ > login({required LoginModel model}) async {
    try {
      response = await dio.post(
          'https://27ad-138-199-22-105.ngrok-free.app/api/login',
          data: model.toJson());

      print(response);

      if (response.statusCode == 200) {
        dynamic temp = response.data;
        TokenModel result = TokenModel(token: temp);
        return result;
        //  LoginModel result = LoginModel.fromMap(temp);
        // return temp['token'];
      } else {
        return ErrorModel(error: response.statusMessage!);
      }
    } catch (e) {
      return ExcptionModel(excption: e.toString());
    }
  }
}
