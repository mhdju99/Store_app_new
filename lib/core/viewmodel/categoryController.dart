import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_app/core/services/categoryService.dart';
import 'package:store_app/models/category_model.dart';


class categoryController extends GetxController {
  String? name;

  final _categoryDataLIst = <categoryData>[].obs;

  List<categoryData> get category => _categoryDataLIst;
  var loading = F.obs;
  @override
  void onInit() {
    fetchcategory();
    super.onInit();
  }

  void fetchcategory() async {
    try {
      loading(T);
      var data = await CategoryService().getcategory();
      if (data != null) {
        _categoryDataLIst.value = data;
      }
    } finally {
      loading(F);
    }
  }


  @override
  void refresh() async {
    loading(T);
    fetchcategory();
  }


}
