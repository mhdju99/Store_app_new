class EndPoints {
  static const String ip = "192.168.43.64";
  

  static const String baseUrl = "http://$ip:8080/api/v1/";
  static const String login_endpoint = '${baseUrl}auth/login';
  static const String signup_endpoint = '${baseUrl}auth/signup';
  static const String suplayer_endpoint = '${baseUrl}supplier';
  static const String Brand_endpoint = '${baseUrl}brand';
  static const String wishlist_endpoint = '${baseUrl}wishlist';
  static const String categories_endpoint = '${baseUrl}categories';
  static const String product_endpoint = '${baseUrl}product';
  static const String Cart_endpoint = '${baseUrl}cart';
  static const String order_endpoint = '${baseUrl}order';

}
