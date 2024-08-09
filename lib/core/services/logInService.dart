import 'package:dio/dio.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/core/constants/end_points.dart';
import 'package:store_app/models/login_model.dart';

class LogInServices {
  final Dio dio;
  LogInServices({
    required this.dio,
  });
  Future<userModel?> logIn({
    required String email,
    required String password,
  }) async {
    print("lllllll");
    Response? response =
        await Api().post(endpoint: EndPoints.login_endpoint, body: {
      "email": email,
      "password": password,
    });
    print(response);
    userModel? user;
    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responses = response.data;
        Map<String, dynamic> item = responses["user"];
        String token = responses["token"];
        user = userModel(
            name: item["name"],
            token: token,
            wishlist: item["wishlist"],
            email: item["email"],
            id: item["_id"]);
        print("ssssssssssssssssss");
        print(user.toString());
        return user;
      } else {
        return user;
      }
    } else {
      return user;
    }
  }
}
