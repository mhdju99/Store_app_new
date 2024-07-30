import 'package:dio/dio.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/core/constants/end_points.dart';

class SignUpServices {
  final Dio dio;
  SignUpServices({
    required this.dio,
  });
  Future<Response?> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      Response? data =
          await Api().post(endpoint: EndPoints.signup_endpoint, body: {
        "email": email,
        "password": password,
        "name": name,
        "passwordConfirmation": password
      });
      print(data);
      return data;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
