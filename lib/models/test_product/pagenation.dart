class Pagenation {
	int? currntPage;
	int? limit;
	int? numberOfPages;
	int? nextPage;

	Pagenation({
		this.currntPage, 
		this.limit, 
		this.numberOfPages, 
		this.nextPage, 
	});

	factory Pagenation.fromJson(Map<String, dynamic> json) => Pagenation(
				currntPage: json['currntPage'] as int?,
				limit: json['limit'] as int?,
				numberOfPages: json['numberOfPages'] as int?,
				nextPage: json['nextPage'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'currntPage': currntPage,
				'limit': limit,
				'numberOfPages': numberOfPages,
				'nextPage': nextPage,
			};
}
