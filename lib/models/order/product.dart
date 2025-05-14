import 'package:store_app/core/constants/end_points.dart';
import 'category.dart';

class ProductOreder {
	String? id;
	String? title;
	String? imageCovered;
	Category? category;
	String? ida;

	ProductOreder({this.id, this.title, this.imageCovered, this.category, this.ida});

	factory ProductOreder.fromJson(Map<String, dynamic> json) => ProductOreder(
				id: json['_id'] as String?,
				title: json['title'] as String?,
				imageCovered: json['imageCovered'].replaceAll("localhost", EndPoints.ip) as String?,
				category: json['category'] == null
						? null
						: Category.fromJson(json['category'] as Map<String, dynamic>),
				ida: json['id'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'title': title,
				'imageCovered': imageCovered,
				'category': category?.toJson(),
				'id': id,
			};
}
