class Category {
	String? id;
	String? name;

	Category({this.id, this.name});

	factory Category.fromJson(Map<String, dynamic> json) => Category(
				id: json['_id'] as String?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'name': name,
			};
}
