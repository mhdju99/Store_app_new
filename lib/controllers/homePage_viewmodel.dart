import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_app/services/productService.dart';
import 'package:store_app/models/poduct_model.dart';

class HomeControllar extends GetxController {
  CartController() {}

  int page = 100;
  final _productLIst = <ProductData>[].obs;
  List<ProductData>? get product => _productLIst;
  final _AllproductLIst = <ProductData>[].obs;
  List<ProductData>? get Allproduct => _AllproductLIst;

    final _filterproductLIst = <ProductData>[].obs;
  List<ProductData> get filterproductLIst => _filterproductLIst;
  var counting = 0;
  String? name, category;

  double min = 0.0, max = 10000;
  var loading = false.obs;
  @override
  void onInit() {
    fetchAllProduct();
    fetchProduct();
    super.onInit();
  }

  void fetchAllProduct() async {
    try {
      int batch = 100;
      // loading(true);
      bool hasMoredata = true;
      while (hasMoredata) {
        var data = await ProductService().getProduct(batch: batch);
        print(batch);
        if (data!.isNotEmpty) {
          _AllproductLIst.addAll(data.toList());
          print(_AllproductLIst.length);

          batch = batch + 100;
        } else {
          hasMoredata = false;
        }
      }
    } finally {
      // loading(false);
    }
  }

  void updates() {
    update();
  }

  void filterProducts(
      {String? query, String? category, double? min, double? max}) {
    _filterproductLIst.value = Allproduct!.where((element) {
      bool matchesQuery = query == null ||
          element.name.toLowerCase().startsWith(query.toLowerCase());
      bool matchesCategory = category == null ||
          element.category.toLowerCase().startsWith(category.toLowerCase());
      bool matchesMin = min == null || element.price >= min;
      bool matchesMax = max == null || element.price <= max;
      return matchesQuery && matchesCategory && matchesMin && matchesMax;
    }).toList();
    update();
  }

  void fetchProduct() async {
    try {
      loading(true);
      var data = await ProductService().getProduct(batch: page);
      if (data != null) {
        print(data);
        _productLIst.value = data.toList();
      }
    } finally {
      loading(false);
    }
  }

  @override
  void nextPage() async {
    print("<<<<<<<<$page");
    if (page != 500) {
      page = page + 100;
    }
    loading(true);

    fetchProduct();
  }

  void prevPage() async {
    print("<<<<<<<<$page");
    if (page != 100) {
      page = page - 100;
    }
    loading(true);

    fetchProduct();
  }
}
