import 'package:dio/dio.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/models/Login_Respons_Model.dart';
import 'package:store_app/models/login_model.dart';

class LogInServices {
  final Dio dio;
  LogInServices({
    required this.dio,
  });
  Future<Response?> logIn({
    required String email,
    required String password,
  }) async {
   try {
      Response? data = await Api()
        .post(url: "https://api.escuelajs.co/api/v1/auth/login", body: {
      "email": email,
      "password": password,
    });
    print(data.toString());
    return data;
   } on DioException catch(e) {

     return e.response;
   }
  }
}
