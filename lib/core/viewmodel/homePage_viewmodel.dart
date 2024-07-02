import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_app/core/services/get_all_product.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/models/product/product.dart';

class HomeControllar extends GetxController {
  CartController() {}

  var _product = <products>[].obs;
  List<products>? get product => _product;
  var counting = 0;
  var loading = F.obs;
  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
     
      loading(T);
      var data = await GetAllProduct(dio: Dio()).get();
      counting++;
      print("sadasd $counting");
      if (data != null) {
        _product.value = data;
      }
    } finally {
      loading(F);
    }
  }

  void refresh() async {
    loading(T);

    fetchProduct();
  }
}
