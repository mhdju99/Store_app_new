import 'category.dart';

class Datum {
	String? id;
	String? title;
	String? slug;
	String? description;
	List<dynamic>? colors;
	List<String>? images;
	String? imageCovered;
	Category? category;
	List<dynamic>? subCategory;
	String? brand;
	int? ratingsAverage;
	int? ratingsQuantity;
	// String? id;
	String? repoInfo;

	Datum({
		this.id, 
		this.title, 
		this.slug, 
		this.description, 
		this.colors, 
		this.images, 
		this.imageCovered, 
		this.category, 
		this.subCategory, 
		this.brand, 
		this.ratingsAverage, 
		this.ratingsQuantity, 
		// this.id, 
		this.repoInfo, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['_id'] as String?,
				title: json['title'] as String?,
				slug: json['slug'] as String?,
				description: json['description'] as String?,
				colors: json['colors'] as List<dynamic>?,
				images: json['images'] as List<String>?,
				imageCovered: json['imageCovered'] as String?,
				category: json['category'] == null
						? null
						: Category.fromJson(json['category'] as Map<String, dynamic>),
				subCategory: json['subCategory'] as List<dynamic>?,
				brand: json['brand'] as String?,
				ratingsAverage: json['ratingsAverage'] as int?,
				ratingsQuantity: json['ratingsQuantity'] as int?,
				// id: json['id'] as String?,
				repoInfo: json['repoInfo'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'title': title,
				'slug': slug,
				'description': description,
				'colors': colors,
				'images': images,
				'imageCovered': imageCovered,
				'category': category?.toJson(),
				'subCategory': subCategory,
				'brand': brand,
				'ratingsAverage': ratingsAverage,
				'ratingsQuantity': ratingsQuantity,
				'id': id,
				'repoInfo': repoInfo,
			};
}
