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
  var loadingAll = false.obs;
  @override
  void onInit() {
    fetchAllProduct();
    fetchProduct();
    super.onInit();
  }
List<String> extractCategory(List<ProductData> productData) {
    final Set<String> categories = {};

    for (var product in productData) {
      categories.add(product.category);
    }

    return categories.toList();
  }
  ProductData? Findproduct(String id) {
    ProductData? product;
    int index = _productLIst.indexWhere((element) => element.id == id);
    print("object $index");

    if (index != -1) {
      product = _productLIst[index];
      return product;
    }
  }
  void fetchAllProduct() async {
    try {
      int batch = 100;
      loadingAll(true);
      bool hasMoredata = true;
      while (hasMoredata) {
        var data = await ProductService().getProduct(batch: batch);
        if (data!.isNotEmpty) {
          _AllproductLIst.addAll(data.toList());

          batch = batch + 100;
        } else {
          hasMoredata = false;
        }
      }
    } finally {
      loadingAll(false);
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
  List<ProductData> cato(String name) {
    List<ProductData> filter = _AllproductLIst
        .where((element) => element.category.contains(name))
        .toList(); // Filter items
    return filter;
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
    if (page != 500) {
      page = page + 100;
    }

    fetchProduct();
  }

  void prevPage() async {
    if (page != 100) {
      page = page - 100;
    }

    fetchProduct();
  }
}
