import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart';
import 'package:dio/dio.dart' as ss;
import 'package:store_app/core/services/orderService.dart';
import 'package:store_app/core/viewmodel/userController.dart';
import 'package:store_app/models/brand_model.dart';
import 'package:store_app/models/order/order.dart';

class orderController extends GetxController {
  String? name;
  userController xx = Get.put(userController());

  final _BarndDataLIst = <OrderData>[].obs;

  List<OrderData> get Barnds => _BarndDataLIst;
  var loading = false.obs;
  @override
  void onInit() {
    userController xx = Get.put(userController());

    fetchBrand();
    super.onInit();
  }

  void fetchBrand() async {
    try {
      loading(true);
      var data = await orderService().getBrand();
      if (data != null) {
        _BarndDataLIst.value =
            data.where((e) => e.user!.email == xx.email).toList();
      }
    } finally {
      loading(false);
    }
  }

  @override
  void refresh() async {
    loading(true);
    fetchBrand();
  }

  // void addoffline() {
  //   _suplayerLIst.add(SuplayerData(
  //       suplayerCountres: country,
  //       suplayerDescription: descraption,
  //       suplayerPhoneNumber: phone,
  //       suplayerEmail: email,
  //       suplayerName: name));
  // }

  // void removeoffline(element) {
  //   _suplayerLIst.remove(element);
  // }
}
