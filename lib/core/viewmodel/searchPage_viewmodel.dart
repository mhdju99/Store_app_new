import 'package:dio/dio.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_app/core/services/productService.dart';
import 'package:store_app/models/poduct_model.dart';

class SearchPageControllar extends GetxController {
  final _productLIst = <ProductData>[].obs;
  String? name, category;
  int? min, max;
  List<ProductData>? get product => _productLIst;

  var loading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void SearchProduct() async {
    try {
      loading(true);
      var data = await ProductService()
          .getProduct(category: category, name: name, min: min, max: max);
      if (data != null) {
       _productLIst.value =
            data.where((element) => element.name.toLowerCase().startsWith(name!.toString())).toList();
      }
    } finally {
      loading(false);
    }
  }
}
