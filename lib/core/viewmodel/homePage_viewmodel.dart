import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_app/core/services/productService.dart';
import 'package:store_app/models/poduct_model.dart';

class HomeControllar extends GetxController {
  CartController() {}
  String? name, category;
  int page = 100;
  double min = 0.0, max = 10000;

  final _productLIst = <ProductData>[].obs;
  List<ProductData>? get product => _productLIst;
  var counting = 0;

  var loading = false.obs;
  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      loading(true);
      var data = await ProductService().getProduct(batch: page);
      if (data != null) {
        _productLIst.value =
            data.where((element) => element.price != null).toList();
      }
    } finally {
      loading(false);
    }
  }

  List<String> extractcategory(List<ProductData> sizesData) {
    return sizesData.map((ProductData) => ProductData.category).toList();
  }

  ProductData? Findproduct(String id) {
    ProductData? product;
    int index = _productLIst.indexWhere((element) => element.id == id);

    if (index != -1) {
      product = _productLIst[index];
      return product;
    }
    return null;
  }



  List<ProductData> cato(String name) {
    List<ProductData> filter = _productLIst
        .where((element) => element.category.contains(name))
        .toList(); // Filter items
    return filter;
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
