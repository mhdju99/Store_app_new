import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());

      
    

  }
  Future<bool> saveUser(String? email, String? password) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.email.toString(), email);
    await box.write(CacheManagerKey.password.toString(), password);
    return true;
  }
    String? getemail() {
    final box = GetStorage();
    return box.read(CacheManagerKey.email.toString());
  }
      String? getPassword() {
    final box = GetStorage();
    return box.read(CacheManagerKey.password.toString());
  }
   Future<void> removeuser() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.email.toString());
    await box.remove(CacheManagerKey.password.toString());
  }
}

enum CacheManagerKey { TOKEN, password , email }
