// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/core/constants/end_points.dart';
import 'package:store_app/models/poduct_model.dart';

class ProductService {
  final String _endpoint = EndPoints.product_endpoint;
  final String _imagesearch = EndPoints.searchByImage_endpoint;

  Future<List<ProductData>?> getProduct({
    String? name = "",
    String? category = "",
    int? min = 0,
    int? batch ,
    int? max = 1000000000,
  }) async {
    Response? response = await Api().get(
        endpoint:
            "${EndPoints.baseUrl}product?category=&max=$max&min=$min&search=&batch=$batch");
    List<ProductData> dataList = [];

    if (response != null) {
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 304) {
        Map<String, dynamic> data = response.data;

        List<dynamic> item = data["products"];

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

  Future<List<ProductData>?> SearchByImage({
    dynamic image,
  }) async {
    Response? response = await Api().post(endpoint: _imagesearch, body: image);
    List<ProductData> dataList = [];
    print(">>>>>>>>>>>>>>>>$response");
    if (response != null) {
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 304) {
        List<dynamic> item = response.data;


        for (var data1 in item) {
          dataList.add(ProductData.fromJson(data1));
          print(">>>>>${ProductData.fromJson(data1)}");
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
