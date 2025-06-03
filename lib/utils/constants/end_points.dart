class EndPoints {
  static const String ip = "192.168.43.64";
  static const String baseUrl = "http://192.168.236.132:3000/api/";
  
  static const String login_endpoint = '${baseUrl}user/login';
  static const String signup_endpoint = '${baseUrl}user';
  static const String suplayer_endpoint = '${baseUrl}supplier';
  static const String Brand_endpoint = '${baseUrl}brand';
  static const String Country_endpoint = '${baseUrl}user/get-countries';
  static const String wishlist_endpoint = '${baseUrl}wishlist';
  static const String categories_endpoint = '${baseUrl}categories';
  static const String product_endpoint = '${baseUrl}product';
  static const String getimage_endpoint = '${baseUrl}product/get-image';
  static const String searchByImage_endpoint = '${baseUrl}product/search-by-image';
  static const String Cart_endpoint = '${baseUrl}cart';
  static const String order_endpoint = '${baseUrl}order';
  static const String buy_endpoint = '${baseUrl}user/buy';
}
