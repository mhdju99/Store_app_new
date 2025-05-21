import 'package:dio/dio.dart';
import 'package:store_app/utils/class/api.dart';
import 'package:store_app/utils/constants/end_points.dart';
import 'package:store_app/models/login_model.dart';

class LogInServices {
  Future<userModel?> logIn({
    required String email,
    required String password,
  }) async {
    Response? response = await Api()
        .get(endpoint: "${EndPoints.baseUrl}user/login?email=$email", header: {
      "password": password,
    });
    userModel? user;
    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responses = response.data;
        Map<String, dynamic> item = responses["user"];
        String token = response.headers["token"]!.first;
        user = userModel(
            name: item["name"],
            token: token,
            email: item["email"],
            id: item["_id"]);

        return user;
      } else {
        return user;
      }
    } else {
      return user;
    }
  }
}
