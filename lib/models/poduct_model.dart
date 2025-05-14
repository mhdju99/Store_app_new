class ProductData {
  String id;
  String publisherId;
  List<Review> reviews;
  String name;
  double price;
  String? description;
  String category;
  List<String> imagesNames;
  List<Quantity> quantities;
  DateTime createdAt;

  ProductData({
    required this.id,
    required this.publisherId,
    required this.reviews,
    required this.name,
    required this.price,
    this.description,
    required this.category,
    required this.imagesNames,
    required this.quantities,
    required this.createdAt,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    var reviewsFromJson = json['reviews'] as List;
    List<Review> reviewsList =
        reviewsFromJson.map((i) => Review.fromJson(i)).toList();

    var quantitiesFromJson = json['quantities'] as List;
    List<Quantity> quantitiesList =
        quantitiesFromJson.map((i) => Quantity.fromJson(i)).toList();

    return ProductData(
      id: json['_id'] ?? '', // تعيين قيمة افتراضية إذا كانت null
      publisherId:
          json['publisherId'] ?? '', // تعيين قيمة افتراضية إذا كانت null
      reviews: reviewsList,
      name: json['name'] ?? '', // تعيين قيمة افتراضية إذا كانت null
      price:
          (json['price'] ?? 0).toDouble(), // تعيين قيمة افتراضية إذا كانت null
      description: json['description'], // يمكن أن تكون null
      category: json['category'] ?? '', // تعيين قيمة افتراضية إذا كانت null
      imagesNames: List<String>.from(
          json['imagesNames'] ?? []), // تعيين قيمة افتراضية إذا كانت null
      quantities: quantitiesList,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Review {
  // يمكنك إضافة خصائص المراجعة هنا إذا كانت موجودة
  Review();

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review();
  }
}

class Quantity {
  String size;
  int quantity;
  String id;

  Quantity({
    required this.size,
    required this.quantity,
    required this.id,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) {
    return Quantity(
      size: json['size'],
      quantity: json['quantity'],
      id: json['_id'],
    );
  }
}
