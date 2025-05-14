// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/core/constants/end_points.dart';
import 'package:store_app/models/brand_model.dart';
import 'package:store_app/models/order/order.dart';



class orderService {
  final String _endpoint = EndPoints.order_endpoint;

  Future<List<OrderData>?> getBrand() async {
    Response? response = await Api().get(endpoint: _endpoint);

    List<OrderData> dataList = [];

    if (response != null) { 
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = response.data;
        List<dynamic> item = data["data"];
        for (var data in item) {
          dataList.add(OrderData.fromJson(data));
        }
        return dataList;
      } else {
        return dataList;
      }
    } else {
      return dataList;
    }
  }


}
