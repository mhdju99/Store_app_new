import 'cart_item.dart';
import 'user.dart';

class OrderData {
  String? id;
  User? user;
  List<CartItem>? cartItems;
  int? taxPrice;
  String? status;
  
  int? shippingPrice;
  String? paymentMethods;
  bool? isPaid;
  bool? isDelivered;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? totalPrice;

  OrderData({
    this.id,
    this.totalPrice,
    this.user,
    this.cartItems,
    this.taxPrice,
    this.status,
    this.shippingPrice,
    this.paymentMethods,
    this.isPaid,
    this.isDelivered,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json['_id'] as String?,
        totalPrice: json['totalPrice'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        cartItems: (json['cartItems'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        taxPrice: json['taxPrice'] as int?,
        status: json['status'] as String?,
        shippingPrice: json['shippingPrice'] as int?,
        paymentMethods: json['paymentMethods'] as String?,
        isPaid: json['isPaid'] as bool?,
        isDelivered: json['isDelivered'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user?.toJson(),
        'cartItems': cartItems?.map((e) => e.toJson()).toList(),
        'taxPrice': taxPrice,
        'status': status,
        'shippingPrice': shippingPrice,
        'paymentMethods': paymentMethods,
        'isPaid': isPaid,
        'isDelivered': isDelivered,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
