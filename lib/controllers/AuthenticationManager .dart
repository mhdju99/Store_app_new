import 'package:get/get.dart';
import 'package:store_app/controllers/CacheManager%20.dart';
import 'package:store_app/utils/class/connectionCheck.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  Future<bool> conniction() async {
    bool x = await checkServerConnection().checkServe();
    return x;
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
