import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart';
import 'package:dio/dio.dart' as ss;
import 'package:store_app/models/address_model.dart';
import 'package:store_app/models/brand_model.dart';

class AddressController extends GetxController {
  String? type;
  String? city;
  String? adress;
  String? phone;

  final _BarndDataLIst = <AddressData>[
    AddressData(adress:  "Al-Midan . Bab Musla,No. 16 A", city:  "Damascus", type: "Home", phone: "+963937334252")
  ].obs;

  List<AddressData> get Barnds => _BarndDataLIst;
  var loading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void add() {
    _BarndDataLIst.add(
        AddressData(adress: adress!, city: city!, type: type!, phone: phone!));
  }

  void del(String phone1) {
    _BarndDataLIst.removeWhere((val) => val.phone == phone1);
  }
}
