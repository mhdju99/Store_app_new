// services/api_service.dart
import 'package:dio/dio.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/models/product/product.dart';

class GetWhishList{
final  baseUrl="https://fakestoreapi.com/products";
  final Dio dio;
  GetWhishList({
    required this.dio,
  });
  Future<List<products>?> getwishlist() async {
    Response? response =
        await Api().get(endpoint: baseUrl);
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
Future<void> addProductToWishlist(int productId) async {
    final response =
        await Api().post(endpoint: '$baseUrl/wishlist', body: {'product_id': productId});
    if (response!.statusCode != 200|| response.statusCode == 201) {
      throw Exception('Failed to add product to wishlist');
    }
  }

  Future<void> removeProductFromWishlist(int productId) async {
    final response = await Api().del(endpoint: '$baseUrl/wishlist/$productId');
    if (response!.statusCode != 200) {
      throw Exception('Failed to remove product from wishlist');
    }
  }




}





