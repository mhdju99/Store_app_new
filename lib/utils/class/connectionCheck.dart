import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:store_app/utils/constants/end_points.dart';

class checkServerConnection {
  Future<bool> checkServe() async {
    // يمكنك إضافة تحقق من السيرفر هنا، مثل استخدام Dio لإجراء طلب GET
    try {
      final response = await Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        validateStatus: (status) => true,
      )).get(EndPoints.Country_endpoint);
      return response.statusCode == 200; // تحقق من حالة السيرفر
    } catch (e) {
      return false; // فشل في الاتصال بالسيرفر
    }
  }
}
