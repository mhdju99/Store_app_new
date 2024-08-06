// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/core/constants/end_points.dart';
import 'package:store_app/models/poduct_model.dart';


class ProductService {
  final String _endpoint = EndPoints.product_endpoint;

  Future<List<ProductData>?> getProduct() async {
    Response? response = await Api().get(endpoint: _endpoint);
    print("response is ${response}");

    List<ProductData> dataList = [];

    if (response != null) {
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 304) {
        Map<String, dynamic> data = response.data;

        List<dynamic> item = data["data"];

        for (var data1 in item) {
          dataList.add(ProductData.fromJson(data1));
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
