import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:store_app/core/services/CartService..dart';
import 'package:store_app/helper/db_helper.dart';
import 'package:store_app/models/cart_data/cart_data.dart';
import 'package:store_app/models/cart_data/cart_item.dart';
import 'package:store_app/models/cart_model.dart';

class CartController extends GetxController {
  // CartController() {
  //   // getallProduct();
  // }
  @override
  void onInit() {
    getallProduct();
    super.onInit();
  }

  final _product = <CartItem>[].obs;
  int totalprice = 0;
  String? CartID;
  List<CartItem> get product => _product;

  var loading = false.obs;
  void add(String id) async {
    var data = await CartService().Addcart(id);
    if (data) {
      Get.rawSnackbar(
          message: "Added successfully", duration: const Duration(seconds: 2));

      getallProduct();
      // return false;
    }
    // if (!data) {
    //   Get.snackbar("warning", "Erorr", duration: const Duration(seconds: 2));
    //   // return true;
    // }
  }
  // addProduct(Cart cart) async {
  //   int index =
  //       product!.indexWhere((element) => element.Productid == cart.Productid);
  //   if (index == -1) {
  //     Database? db = await Sqllite().insertData(cart);
  //     getallProduct();
  //   }
  // }

  void del(String id) async {
    _product.removeWhere((val) => val.id == id);

    var state = await CartService().delItemcart(id);
    if (!state) {
      Get.snackbar("title", "Erorr");
      // return false;
    }

    // return null;
  }

  incrise(String id, int max) async {
    int maaax = 10;
    int index = _product.indexWhere((val) => val.id == id);
    if (_product[index].quantity! < maaax) {
      int q = _product[index].quantity! + 1;
      print(_product[index].quantity);
      _product[index].quantity = q;
      update();
      print(_product[index].quantity);
      var state = await CartService().update(id, q);
      if (!state) {
        Get.snackbar("title", "Erorr");
        // return false;
      }
    } else if (_product[index].quantity! == maaax) {
      Get.snackbar(
        "warning",
        "There are not enough quantities",
        backgroundColor: Colors.blueGrey.shade100,
      );
    }
  }

  decrise(String id) async {
    int index = _product.indexWhere((val) => val.id == id);
    if (_product[index].quantity! != 0) {
      _product[index].quantity = _product[index].quantity! - 1;
      int q = _product[index].quantity! - 1;
      _product[index].quantity = q;
      update();
      var state = await CartService().update(id, q);
      if (!state) {
        Get.snackbar("warning", "Error");
        // return false;
      }
    }
  }

  Future<bool> checkout(String id) async {
    var state = await CartService().checkout(
      id,
    );
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

  getallProduct() async {
    try {
      loading(true);
      var data = await CartService().getcart();
      _product.value = data.cartItems!;
      totalprice = data.totalPrice!;
      CartID = data.id;
    } finally {
      loading(false);
    }
  }

  double get price {
    return product.fold(
        0, (sum, item) => sum + (item.price! * item.quantity!.toInt()));
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