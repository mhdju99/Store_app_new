import 'package:dio/dio.dart';

class Api {
  Future<Response?> get({
    required String url,
    String? token,
  }) async {
    try {
      Map<String, dynamic> headers = {};
      if (token != null) {
        headers.addAll({"Authorization": "Bearer $token"});
      }
      Response response = await Dio().get(
        url,
        queryParameters: headers,
      );

      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }

  Future<Response?> post({
    required String url,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    try {
      Response response = await Dio().post(url,
          data: body,
          options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }

  Future<dynamic> put({
    required String url,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    try {
      Map<String, dynamic> headers = {};
      headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
      if (token != null) {
        headers.addAll({"Authorization": "Bearer $token"});
      }
      Response response =
          await Dio().put(url, data: body, queryParameters: headers);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Error with status code = ${response.statusCode} ");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> del({
    required String url,
    String? token,
  }) async {
    try {
      Map<String, dynamic> headers = {};
      headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
      if (token != null) {
        headers.addAll({"Authorization": "Bearer $token"});
      }
      Response response =
          await Dio().delete(url, queryParameters: headers);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Error with status code = ${response.statusCode} ");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
