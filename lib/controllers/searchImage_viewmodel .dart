import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_app/services/productService.dart';
import 'package:store_app/models/poduct_model.dart';

class SearchImageControllar extends GetxController {
  final _productLIstResulit = <ProductData>[].obs;

  List<ProductData> get product => _productLIstResulit;
  var image1 = Rx<XFile?>(null);
  var isOriginalContent = true.obs;

  var loading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> pickImage1() async {
    final ImagePicker picker = ImagePicker();

    final XFile? photo =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (photo != null) {
      image1.value = photo;
      SearchProduct(); // ← إرسال الصورة مباشرة بعد اختيارها
    }
    // image1.value = photo;
  }

  void toggleContent() {
    isOriginalContent.value = !isOriginalContent.value;
  }

  void SearchProduct() async {
    try {
      loading(true);
      dio.FormData formData = dio.FormData.fromMap({
        'file': await dio.MultipartFile.fromFile(image1.value!.path,
            filename: 'image.jpg'),
      });
      var data = await ProductService().SearchByImage(image: formData);
      if (data != null) {
        _productLIstResulit.value = data;
      }
    } finally {
      loading(false);
    }
  }
}
