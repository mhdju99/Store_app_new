import 'category.dart';

class AllProduct {
	int? id;
	String? title;
	int? price;
	String? description;
	String? images;
	DateTime? creationAt;
	DateTime? updatedAt;
	Category? category;

	AllProduct({
		this.id, 
		this.title, 
		this.price, 
		this.description, 
		this.images, 
		this.creationAt, 
		this.updatedAt, 
		this.category, 
	});

	factory AllProduct.fromJson(dynamic json) => AllProduct(
				id: json['id'] as int?,
				title: json['title'] as String?,
				price: json['price'] as int?,
				description: json['description'] as String?,
				images: json['images'][0] as  String?,
				creationAt: json['creationAt'] == null
						? null
						: DateTime.parse(json['creationAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				category: json['category'] == null
						? null
						: Category.fromJson(json['category'] as Map<String, dynamic>),
			);

	
}
