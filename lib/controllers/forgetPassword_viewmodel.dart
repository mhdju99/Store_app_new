import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:store_app/services/forgetPasswordService.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store_app/services/productService.dart';
import 'package:store_app/models/poduct_model.dart';
import 'package:store_app/view/screens/logInPage.dart';
import 'package:store_app/view/screens/resetPassword.dart/VerificationCode.dart';
import 'package:store_app/view/screens/resetPassword.dart/newPassword.dart';

class forgetPasswordControllar extends GetxController {
  // final _productLIst = <ProductData>[].obs;
  // List<ProductData>? get product => _productLIst;
  // final _AllproductLIst = <ProductData>[].obs;
  // List<ProductData>? get Allproduct => _AllproductLIst;

  //   final _filterproductLIst = <ProductData>[].obs;
  // List<ProductData> get filterproductLIst => _filterproductLIst;
  // var counting = 0;
  String? email, token, code, password;

  // double min = 0.0, max = 10000;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void getcode() async {
    try {
      isLoading(true);
      var data = await Forgetpasswordservice().getCode(email);
      if (data != null) {
        if (data == 200) {
          Get.snackbar("1", "done", duration: const Duration(seconds: 1));
          Get.to(Verificationcode());
        } else {
          Get.snackbar("0", "email not found",
              duration: const Duration(seconds: 1));
        }
      }
    }
    // catch (e) {
    //   Get.snackbar("00", "net erorr", duration: const Duration(seconds: 1));
    // }
    finally {
      isLoading(false);
    }
  }

  void verfiycode() async {
    try {
      isLoading(true);
      var data =
          await Forgetpasswordservice().verifyCode(code: code, email: email);
      if (data != null) {
        if (data != "") {
          token = data;
          Get.snackbar("", "done", duration: const Duration(seconds: 1));
          Get.to(Newpassword());
        } else {
          Get.snackbar("", "invalid codet",
              duration: const Duration(seconds: 1));
        }
      }
    }
    // catch (e) {
    //   Get.snackbar("00", "net erorr", duration: const Duration(seconds: 1));
    // }
    finally {
      isLoading(false);
    }
  }

  void resetPassword() async {
    try {
      isLoading(true);
      var data = await Forgetpasswordservice()
          .resetPassword(newPassword: password, token: token);
        if (data != null) {
        if (data == 200) {
          Get.snackbar("1", "done", duration: const Duration(seconds: 1));
          Get.offAll(LogIn());
        } else {
          Get.snackbar("0", "Error",
              duration: const Duration(seconds: 1));
        }
      }
    }
    // catch (e) {
    //   Get.snackbar("00", "net erorr", duration: const Duration(seconds: 1));
    // }
    finally {
      isLoading(false);
    }
  }

  confirmPassword(String? pwd, String? confpassword) {
    if (pwd != confpassword) {
      return "Passwords must be same";
    } else {
      return null;
    }
  }

  validatePassword(String? pwd) {
    if (GetUtils.isLengthLessThan(pwd ?? "", 5)) {
      return "password must be 8 char ";
    } else {
      return null;
    }
  }

  validateEmail(String? Email) {
    if (!GetUtils.isEmail(Email ?? "")) {
      return "email not correct";
    } else {
      return null;
    }
  }
}
