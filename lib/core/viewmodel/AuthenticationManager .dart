import 'package:get/get.dart';
import 'package:store_app/core/viewmodel/CacheManager%20.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }

  @override
  void saveUser1(String? email, String? password) async {
    await saveUser(email, password);
  }
}
