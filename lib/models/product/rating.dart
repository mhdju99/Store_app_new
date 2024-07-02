class Rating {
	double? rate;
	int? count;

	Rating({this.rate, this.count});

	@override
	String toString() => 'Rating(rate: $rate, count: $count)';

	factory Rating.fromJson(Map<String, dynamic> json) => Rating(
				rate: (json['rate'] as num?)?.toDouble(),
				count: json['count'] as int?,
			);

}
