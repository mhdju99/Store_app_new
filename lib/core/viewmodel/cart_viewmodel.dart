import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:store_app/core/services/CartService..dart';
import 'package:store_app/helper/db_helper.dart';
import 'package:store_app/models/cart_data/cart_item.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/models/poduct_model.dart';

class CartController extends GetxController {
  String? selectedSize = "";
  // CartController() {
  //   // getallProduct();
  // }

  final _product = <CartItem>[].obs;
  int totalprice = 0;
  String? CartID;
  List<CartItem> get product => _product;

  var loading = false.obs;
  void add(CartItem item) {
    int index = product.indexWhere((element) =>
        element.product == item.product && element.size == item.size);
    if (index == -1) {
      _product.add(item);
      Get.rawSnackbar(
          message: "Added successfully", duration: const Duration(seconds: 1));
    } else {
      Get.snackbar("warning", "product alredy in cart",
          duration: const Duration(seconds: 1));
    }
    update();
  }

  void changeSize(String newsize) {
    selectedSize = newsize;
    update();
  }

  void resitSize() {
    selectedSize = "";
    update();
  }

  void del(CartItem item) async {
    _product.removeWhere((val) => val == item);
    update();

    // return null;
  }

  List<String> extractSizes(List<Quantity> sizesData) {
    return sizesData
        .where((val) => val.quantity != 0)
        .map((Quantity) => Quantity.size)
        .toList();
  }

  incrise(CartItem item, int max) {
    int maaax = 10;
    int index = _product.indexWhere((val) => val == item);
    if (_product[index].quantity! < maaax) {
      int q = _product[index].quantity! + 1;
      _product[index].quantity = q;
      update();
    } else if (_product[index].quantity! == maaax) {
      Get.snackbar(
        "warning",
        "There are not enough quantities",
        backgroundColor: Colors.blueGrey.shade100,
      );
    }
  }

  decrise(CartItem item) {
    int index = _product.indexWhere((val) => val == item);
    if (_product[index].quantity! != 1) {
      _product[index].quantity = _product[index].quantity! - 1;

      update();
    }
  }

  Future<bool> checkout(List<CartItem> items) async {
    List body = items.map((item) {
      return {
        "product": {"_id": item.product.id},
        "quantity": item.quantity,
        "size": item.size
      };
    }).toList();
    var state = await CartService().checkout(body);
    if (state) {
      return true;
    } else {
      return false;
    }
  }

  // updateproduct(Cart cart) async {
  //   Database? db = await Sqllite().updatData(cart);
  //   update();
  // }

  // getallProduct() async {
  //   try {
  //     loading(true);
  //     var data = await CartService().getcart();
  //     _product.value = data.cartItems!;
  //     totalprice = data.totalPrice!;
  //     CartID = data.id;
  //   } finally {
  //     loading(false);
  //   }
  // }

  double get price {
    return product.fold(
        0, (sum, item) => sum + (item.product.price * item.quantity!.toInt()));
  }

  bool get isempity => product.isEmpty;
}

// class BrandController extends GetxController {
//   String? name;

//   final _BarndDataLIst = <BarndData>[].obs;
//   var image = Rx<XFile?>(null);

//   List<BarndData> get Barnds => _BarndDataLIst;
//   var loading = F.obs;
//   @override
//   void onInit() {
//     fetchBrand();
//     super.onInit();
//   }

//   Future<void> pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       image.value = pickedFile;
//     }
//   }

//   void fetchBrand() async {
//     try {
//       loading(T);
//       var data = await BrandService().getBrand();
//       if (data != null) {
//         _BarndDataLIst.value = data;
//       }
//     } finally {
//       loading(F);
//     }
//   }

//   void del(String id) async {
//     try {
//       loading(T);
//       var state = await BrandService().delBrand(id);

//       if (!state) {
//         Get.snackbar("title", "Erorr");
//         // return false;
//       }
//       if (state) {
//         Get.snackbar("title", "succsess");
//         // return true;
//       }
//     } finally {
//       refresh();
//     }
//     // return null;
//   }

//   void add() async {
//     try {
//       // loading(T);
//       // File file = File(image.value!.path);
//       Uint8List bytes = await image.value!.readAsBytes();

//       var formDatass = ss.FormData.fromMap({
//         'image': ss.MultipartFile.fromBytes(
//           bytes,
//           filename: image.value!.name,
//         ),
//         'name': name,
//       });
//       var data = await BrandService().AddBrand(formDatass);

//       if (data) {
//         Get.snackbar("title", "add succsee",
//             backgroundColor: Colors.greenAccent);
//         // return false;
//       }
//       if (!data) {
//         Get.snackbar("title", "errorr");
//         // return true;
//       }
//     } finally {
//       refresh();
//     }
//   }

//   @override
//   void refresh() async {
//     loading(T);
//     fetchBrand();
//   }

//   // void addoffline() {
//   //   _suplayerLIst.add(SuplayerData(
//   //       suplayerCountres: country,
//   //       suplayerDescription: descraption,
//   //       suplayerPhoneNumber: phone,
//   //       suplayerEmail: email,
//   //       suplayerName: name));
//   // }

//   // void removeoffline(element) {
//   //   _suplayerLIst.remove(element);
//   // }
// }
 // incrise(int index) {
  //   final x = product![index].quantity;
  //   if (x != null) {
  //     product![index].quantity = x + 1;

  //     update();
  //     updateproduct(product![index]);
  //   }
  // }

  // decrise(int index) {
  //   final x = product![index].quantity;
  //   if (x != null && x != 0) {
  //     product![index].quantity = x - 1;

  //     update();
  //     updateproduct(product![index]);
  //   }
  // }