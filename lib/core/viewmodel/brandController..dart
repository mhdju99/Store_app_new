import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:http/http.dart';
import 'package:dio/dio.dart' as ss;
import 'package:store_app/core/services/brandService..dart';
import 'package:store_app/models/brand_model.dart';


class BrandController extends GetxController {
  String? name;

  final _BarndDataLIst = <BarndData>[].obs;

  List<BarndData> get Barnds => _BarndDataLIst;
  var loading = false.obs;
  @override
  void onInit() {
    fetchBrand();
    super.onInit();
  }



  void fetchBrand() async {
    try {
      loading(true);
      var data = await BrandService().getBrand();
      if (data != null) {
        _BarndDataLIst.value = data;
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
