import 'cart_item.dart';

class CartData {
	String? id;
	List<CartItem>? cartItems;
	String? user;
	DateTime? createdAt;
	DateTime? updatedAt;
	int? v;
	int? totalPrice;

	CartData({
		this.id, 
		this.cartItems, 
		this.user, 
		this.createdAt, 
		this.updatedAt, 
		this.v, 
		this.totalPrice, 
	});

	factory CartData.fromJson(Map<String, dynamic> json) => CartData(
				id: json['_id'] as String?,
				cartItems: (json['cartItems'] as List<dynamic>?)
						?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
						.toList(),
				user: json['user'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				v: json['__v'] as int?,
				totalPrice: json['totalPrice'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'cartItems': cartItems?.map((e) => e.toJson()).toList(),
				'user': user,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
				'__v': v,
				'totalPrice': totalPrice,
			};
}
