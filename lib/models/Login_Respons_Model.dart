class LoginResponsModel {
  String? token;


  LoginResponsModel({this.token});

  factory LoginResponsModel.fromJson(Map<String, dynamic> json) => LoginResponsModel(
        token: json['access_token'] as String?,
        
      );
}
