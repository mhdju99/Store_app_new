import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:store_app/services/CountryService.dart';
import 'package:store_app/services/logInService.dart';
import 'package:store_app/services/signUpServices.dart';
import 'package:store_app/controllers/AuthenticationManager%20.dart';
import 'package:store_app/controllers/userController.dart';
import 'package:store_app/models/CountryModel.dart';
import 'package:store_app/view/screens/LandingPage.dart';
import 'package:store_app/view/screens/onBorder.dart';

class AuthController extends GetxController {
  late AuthenticationManager _authManager;
  userController cc = Get.put(userController());
  final CountryService _countryService = CountryService();

  RxBool isLoading = false.obs;
  var obscureText = true.obs;
  var countries = <String>[].obs;
  var isLoadingC = true.obs;
  var isOriginalContent = false.obs;

  String? email, password, name, city, country, address, pp;
  @override
  void onInit() {
    super.onInit();
    _authManager = Get.find();
    fetchCountries();
  }

  void toggle() {
    obscureText.value = !obscureText.value;
  }

  void toggleContent() {
    isOriginalContent.value = !isOriginalContent.value;
  }

  validateEmail(String? Email) {
    if (!GetUtils.isEmail(Email ?? "")) {
      return "email not correct";
    } else {
      return null;
    }
  }

  void fetchCountries() async {
    try {
      isLoadingC(true);
      CountryModel countryModel = await _countryService.getCountry();

      if (countryModel.success) {
        countries.assignAll(countryModel.countries);
      }
    } finally {
      isLoadingC(false);
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
        address: address.toString(),
        city: city.toString(),
        country: country.toString(),
        name: name.toString(),
        email: email.toString(),
        password: password.toString());
    isLoading.value = false;
    if (result!.statusCode == 200 || result.statusCode == 201) {
      Get.snackbar("success", "success");
      Get.offAll(const OnBoard());
    } else {
      isLoading.value = false;

      Get.snackbar(
          result.statusCode.toString(), result.statusMessage.toString());
    }
  }

  login() async {
    var result = await LogInServices()
        .logIn(email: email.toString(), password: password.toString());
    isLoading.value = false;
    if (result != null) {
      _authManager.login(result.token);
      cc.email = result.email;
      cc.id = result.id;
      cc.name = result.name;
      Get.offAll(
        LandingPage(),
      );
    } else {
      Get.snackbar(".", "The Username or Password is Incorrect");
    }
  }
}
