// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_app/utils/class/api.dart';
import 'package:store_app/utils/constants/end_points.dart';
import 'package:store_app/models/poduct_model.dart';

class Forgetpasswordservice {
  final String _endpoint = EndPoints.product_endpoint;
  final String _imagesearch = EndPoints.searchByImage_endpoint;

  Future<int?> getCode(String? Email) async {
    Response? response = await Api()
        .get(endpoint: "${EndPoints.baseUrl}user/recover-account?email=$Email");
    if (response != null) {
      return response.statusCode;
    }
    return null;
  }

  Future<String?> verifyCode({
     String? email,
     String? code,
  }) async {
    Response? response = await Api().post(
        endpoint: "${EndPoints.baseUrl}user/recover-account",
        header: {"code": code},
        body: {"email": email});
    print("??????$response?????");
    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
            print("??????${response.data["token"]}?????");

        return response.data["token"];
      } else {
        return "";
      }
    } else {
      return "";
    }
  }
   Future<int?> resetPassword({
    String? newPassword,
    String? token,
  }) async {
    Response? response = await Api().patch(
        endpoint: "${EndPoints.baseUrl}user/reset-password",
        header: {"token": token},
        body: {"password": newPassword});
    print("??????$response?????");
    if (response != null) {
       return response.statusCode;
    } else {
      return null;
    }
  }
}
