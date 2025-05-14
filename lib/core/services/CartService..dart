// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/core/constants/end_points.dart';
import 'package:store_app/models/cart_data/cart_item.dart';

class CartService {
  final String _endpoint = EndPoints.Cart_endpoint;
  final String _buyendpoint = EndPoints.buy_endpoint;


  Future<bool> checkout(
    dynamic items,
  ) async {
    Response? response = await Api()
        .post(endpoint: EndPoints.buy_endpoint, body: items);
    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> delcart(String id) async {
    Response? response = await Api().del(
      endpoint: '$_endpoint/$id',
    );
    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
