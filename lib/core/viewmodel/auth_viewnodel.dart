import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:store_app/core/services/logInService.dart';
import 'package:store_app/core/services/signUpServices.dart';
import 'package:store_app/core/viewmodel/AuthenticationManager%20.dart';
import 'package:store_app/core/viewmodel/userController.dart';
import 'package:store_app/view/LandingPage.dart';
import 'package:store_app/view/onBorder.dart';

class AuthController extends GetxController {
  late AuthenticationManager _authManager;
  userController cc = Get.put(userController());
  RxBool isLoading = false.obs;
  var obscureText = true.obs;

  String? email, password, name, pp;
  @override
  void onInit() {
    super.onInit();
    _authManager = Get.find();
  }

  void toggle() {
    obscureText.value = !obscureText.value;
  }

  validateEmail(String? Email) {
    if (!GetUtils.isEmail(Email ?? "")) {
      return "email not correct";
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

  confirmPassword(String? pwd) {
    if (pwd != pp) {
      return "Passwords must be same";
    } else {
      return null;
    }
  }

  signUp() async {
    var result = await SignUpServices(
      dio: Dio(),
    ).signUp(
        name: name.toString(),
        email: email.toString(),
        password: password.toString());
    isLoading.value = false;
    if (result!.statusCode == 200 || result.statusCode == 201) {
      Get.snackbar("success", "success");
      Get.offAll(const OnBoard());
    } else {
      Get.snackbar(
          result.statusCode.toString(), result.statusMessage.toString());
    }
  }

  login() async {

    var result = await LogInServices(
      dio: Dio(),
    ).logIn(email: email.toString(), password: password.toString());
    isLoading.value = false;
    if (result != null) {
      _authManager.login(result.token);
      cc.email = result.email;
      cc.id = result.id;
      cc.name = result.name;
      cc.wishlist.value = result.wishlist!;
      Get.offAll(
        LandingPage(),
      );
    } else {
      Get.snackbar(".", "errror");
    }
  }
}
