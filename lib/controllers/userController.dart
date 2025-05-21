import 'package:flutter/material.dart';
import 'package:get/get.dart';

class userController extends GetxController {
  String? email, name, id;
  var wishlist = <dynamic>[].obs;
  bool isInWishList(String id) {
    if (wishlist != null) {
      int index = wishlist!.indexWhere((element) => element == id);
      if (index != -1) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // void del(String id) async {
  //   var state = await whishlistService().delBrand(id);
  //   wishlist.remove(id);

  //   if (!state) {
  //     Get.snackbar("title", "Erorr",
  //     duration: Duration(seconds: 2));
  //     // return false;
  //   }
  //   if (state) {
  //     Get.rawSnackbar(message: "del succsess",
  //     duration: Duration(seconds: 2));

  //   }
  // }

  // void add(String id) async {
  //   var data = await whishlistService().AddBrand(id);
  //   wishlist.add(id);
  //   if (data) {
  //     Get.rawSnackbar(message: "add succsess",
  //     duration: Duration(seconds: 2) );
  //     // return false;
  //   }
  //   if (!data) {
  //     Get.snackbar("title", "errorr",
  //     duration: Duration(seconds: 2));
  //     // return true;
  //   }
  // }
}
