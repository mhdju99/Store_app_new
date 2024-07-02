class Cart {
  int? Productid;
  String? title;
  double? price;
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
        Productid: json['Productid'] as int?,
        title: json['title'] as String?,
        price: (json['price'] as num?)?.toDouble(),
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
