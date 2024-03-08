import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hurry_app/domain/model/delete_vertex_model.dart';
import 'package:hurry_app/domain/model/get_verteses_model.dart';
import 'package:hurry_app/domain/services/base_service.dart';
import 'package:hurry_app/token_model/token_model.dart';

List<GetVertesesModelResponse> resultModel = [];

class ImpVertesesService extends BaseService {
  Future<List<ResultModel>> getVerteses() async {
    try {
      Response response = await dio.get('$authUrl/admin/vertices');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.data);
        dynamic temp = response.data;
        // print(temp);

        List<GetVertesesModelResponse> result = List.generate(temp.length,
            (index) => GetVertesesModelResponse.fromMap(temp[index]));
        // List<GetVertesesModelResponse> result = List.generate(temp.lenght,
        //     (index) => GetVertesesModelResponse.fromMap(temp[index]));
        // print('hello $result');
        resultModel = result;

        return result;
      } else {
        dynamic temp = response.data;
        List<ErrorModel> result = [ErrorModel(messaeg: temp['error'])];
        return result;
      }
    } catch (e) {
      String exc = e.toString();
      List<ErrorModel> result = [ErrorModel(messaeg: exc)];
      return result;
    }
  }

  Future<ResultModel> DeleteVertex(DeleteVertexModel index) async {
    try {
      Response response =
          await dio.delete('$authUrl/admin/vertices', data: index.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        DeleteVertexModelResponse result =
            DeleteVertexModelResponse(message: response.data);
        return result;
      } else {
        print('Error service');
        ErrorModel result = ErrorModel(messaeg: 'Error');
        return result;
      }
    } catch (e) {
      String exc = e.toString();
      print('exciption : $exc');
      ErrorModel result = ErrorModel(messaeg: exc);
      return result;
    }
  }
}
