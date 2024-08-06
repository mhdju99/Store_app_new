// ignore_for_file: public_member_api_docs, sort_constructors_first
class userModel {
	String? name;
	String? token;
	String? email;
	String? id;
   final List<dynamic>? wishlist;


  userModel({
    this.name,
    this.token,
    this.email,
    this.id,
     this.wishlist,
  });

	factory userModel.fromJson(Map<String, dynamic> json) => userModel(
				name: json['email'] as String?,
				token: json['token'] as String?,
        wishlist: List<String>.from(json['wishlist'])
			);


  @override
  String toString() {
    return 'userModel(name: $name, token: $token, email: $email, id: $id)';
  }
}
