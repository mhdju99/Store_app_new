import 'package:dio/dio.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_app/core/services/get_all_product.dart';
import 'package:store_app/core/services/productService.dart';
import 'package:store_app/core/viewmodel/brandController..dart';
import 'package:store_app/models/poduct_model.dart';
import 'package:store_app/models/product/product.dart';

class HomeControllar extends GetxController {
  CartController() {}
  BrandController bb = Get.put(BrandController());

  var _productLIst = <ProductData>[].obs;
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
      var data = await ProductService().getProduct();
      if (data != null) {
        print(data);
        _productLIst.value = data
        .where((element) => element.repoInfo.price !=null)
        .toList();
      }
    } finally {
      loading(false);
    }
  }

  ProductData Findproduct(String id) {
    ProductData? product;
    int index = _productLIst.indexWhere((element) => element.id == id);
    print("object $index");
    product = _productLIst[index];

    return product;
  }

  String? FindBrand(String id) {
    String? brand;
    print(bb.Barnds);
    int index =
        bb.Barnds.indexWhere((element) => element.BrandId!.contains(id));
    print("object $index");
    brand = bb.Barnds[index].BrandName;

    return brand;
  }

  List<ProductData> cato(String name) {
    List<ProductData> filter = _productLIst
        .where((element) => element.category.name.contains(name))
        .toList(); // Filter items
    return filter;
  }

  void refresh() async {
    loading(true);

    fetchProduct();
  }
}
