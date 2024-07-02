// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/models/product/product.dart';
import 'package:store_app/models/test_product/test_product.dart';

class test_service {
  final Dio dio;
  test_service({
    required this.dio,
  });
  Future<List<TestProduct>?> get() async {
    Response? response =
        await Api().get(url: "https://fakestoreapi.com/products");
    List<TestProduct> allProductList = [];

    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic data = response.data;
        print(data);
        for (var data in data) {
          allProductList.add(TestProduct.fromJson(data));
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
