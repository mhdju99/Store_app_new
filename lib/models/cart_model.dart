// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cart {
  String? Productid;
  String? title;
  int? price;
  String? image;
  int? quantity;

  Cart({
    this.Productid,
    this.title,
     this.price,
    this.image,
    this.quantity,
  });

  @override
  String toString() {
    return 'Product(id: $Productid, title: $title, price: $price, quantity: $quantity)';
  }

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        Productid: json['Productid'] as String?,
        title: json['title'] as String?,
        price: (json['price'] as num?)?.toInt(),
        quantity: json['quantity'] as int?,
        image: json['image'] as String?,
      );
  tojson() {
    return {
      "Productid": Productid,
      "title": title,
      "image": image,
      "price": price,
      "quantity": quantity,
    };
  }
}
