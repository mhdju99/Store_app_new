// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/models/product/product.dart';

class GetAllProduct {
  final Dio dio;
  GetAllProduct({
    required this.dio,
  });
  Future<List<products>?> get() async {
    Response? response =
        await Api().get(url: "https://fakestoreapi.com/products");
    List<products> allProductList = [];

    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> data = response.data;
        for (var data in data) {
          allProductList.add(products.fromJson(data));
       
        }
           return allProductList;
      } else {
        return allProductList;
      }
    } else {
      return allProductList;
    }
  }
}
