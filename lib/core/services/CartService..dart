// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:store_app/core/class/api.dart';
import 'package:store_app/core/constants/end_points.dart';
import 'package:store_app/models/cart_data/cart_data.dart';
import 'package:store_app/models/cart_data/cart_item.dart';

class CartService {
  final String _endpoint = EndPoints.Cart_endpoint;
  final String _endpointOrder = EndPoints.order_endpoint;

  Future<CartData> getcart() async {
    Response? response = await Api().get(endpoint: _endpoint);
    // print(response);
    CartData cart = CartData();

    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = response.data;
        Map<String, dynamic> item = data["data"];
        cart = CartData.fromJson(item);

        return cart;
      } else {
        return cart;
      }
    } else {
      return cart;
    }
  }

  Future<bool> Addcart(String id) async {
    Response? response =
        await Api().post(endpoint: _endpoint, body: {"productId": id});
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

  Future<bool> delItemcart(String id) async {
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

  Future<bool> update(String id, int q) async {
    Response? response =
        await Api().put(endpoint: '$_endpoint/$id', body: {"quantity": q});
    print(response);
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

  Future<bool> checkout(
    String id,
  ) async {
    Response? response = await Api()
        .post(endpoint: '$_endpointOrder/checkout-session/$id', body: {});
    print("aaaaaaaaa$response");
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
