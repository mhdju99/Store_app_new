import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:store_app/controllers/AuthenticationManager%20.dart';

class Api {
  AuthenticationManager cc = g.Get.find();
  final _dios = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    validateStatus: (status) => true,
  ));

  Api() {
    // _dio.options.baseUrl = "http://localhost:8080/api/v1/";
    final String? token = cc.getToken();
    if (token != null) {
      _dios.options.headers = {"token": token};
    }
  }

  Future<Response?> get(
      {required String endpoint, Map<String, dynamic>? header}) async {
    try {
      // Map<String, dynamic> headers = {};

      Response response = await _dios.get(endpoint,
          options: Options(
            contentType: Headers.jsonContentType,
            headers: header,
            responseType: ResponseType.json,
          )
          // queryParameters: headers,
          );

      return response;
    } on DioException catch (e) {
      g.Get.snackbar("0", "${e.message}", duration: const Duration(seconds: 1));
    }
    return null;
  }

  Future<Response?> post(
      {required String endpoint,
      required var body,
      Map<String, dynamic>? header}) async {
    final String? tokens = cc.getToken();

    // Map<String, dynamic> headers = {};
    // headers.addAll({"Authorization": "Bearer $tokens"});

    // if (token != null) {
    // }
    try {
      Response response = await _dios.post(endpoint,
          data: body,
          options: Options(
            headers: header,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
  Future<Response?> patch(
      {required String endpoint,
      required var body,
      Map<String, dynamic>? header}) async {
    final String? tokens = cc.getToken();

    // Map<String, dynamic> headers = {};
    // headers.addAll({"Authorization": "Bearer $tokens"});

    // if (token != null) {
    // }
    try {
      Response response = await _dios.patch(endpoint,
          data: body,
          options: Options(
            headers: header,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
  Future<dynamic> put({
    required String endpoint,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    try {
      // Map<String, dynamic> headers = {};
      // headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
      // if (token != null) {
      //   headers.addAll({"Authorization": "Bearer $token"});
      // }
      Response response = await _dios.put(
        endpoint,
        data: body,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Error with status code = ${response.statusCode} ");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response?> del({
    required String endpoint,
  }) async {
    try {
      Response response = await _dios.delete(endpoint,
          options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));

      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
